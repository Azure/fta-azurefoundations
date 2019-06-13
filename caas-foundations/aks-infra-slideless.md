# Azure Kubernetes Service (AKS)  
In this slide-less delivery for AKS, we will talk through with the customer on requirements, decisions, and the necessary information they will need to deploy an AKS cluster for a POC engagement. 

## AKS Concepts
If the customer is completely new to Kubernetes and the AKS service, it may make sense to go over some of the basic concepts and understandings for AKS. The Kubernetes core concepts for AKS page is a good start to introduce the customer to the AKS service.

https://docs.microsoft.com/en-us/azure/aks/concepts-clusters-workloads

> **SPEAKER NOTES**

Some frequent questions asked about the AKS service are:
1. What is the architecture of the master nodes?
    * Explain to the customer that AKS is a platform managed Kubernetes service and should be considered like all other PaaS services            on Azure. There are no specific hardware specification to share and the service will scale to the customer needs. 
2. What container runtime does AKS use?
    * AKS uses the Moby container runtime. Moby is a open source container framework developed by Docker.
3.	What is AKS-Engine and how does it differ from the AKS service in Azure?
    * “AKS Engine provides convenient tooling to quickly bootstrap Kubernetes clusters on Azure. By leveraging ARM (Azure Resource Manager), AKS Engine helps you create, destroy and maintain clusters provisioned with basic IaaS resources in Azure. AKS Engine is also the library used by AKS for performing these operations to provide managed service implementations.” https://github.com/Azure/aks-engine
    * AKS-Engine is useful for a more customized Kubernetes experience on Azure. You have the option of choosing node OSs and container runtimes as an example using AKS-Engine.
    
## Planning
Before deploying the AKS service there are some key information and understandings we’ll need from the customer to ensure we’re planning the AKS cluster with the features needed to fulfill the customer’s usage and expectations.

### Sizing the AKS Cluster
When it comes to sizing the cluster, there are generally two key metrics to understand, how many pods and the resource demand of the containers in the pods.

> **SPEAKER NOTES**
* Make sure the customer in their calculation is aware of the Kubernetes resource reservations https://docs.microsoft.com/en-us/azure/aks/concepts-clusters-workloads#resource-reservations

* Share the AKS Quota Limits https://docs.microsoft.com/en-us/azure/aks/quotas-skus-regions#service-quotas-and-limits

* We advise customers to utilize the Azure CNI and to deploy the cluster utilizing the Azure CLI or ARM template. If the cluster is deployed using the Azure CLI or ARM template, you can have up to 250 pods per node. If you deploy the cluster through the portal using the Azure CNI (Advanced Networking) you are limited to 30 pods per cluster node. https://docs.microsoft.com/en-us/azure/aks/configure-azure-cni#maximum-pods-per-node

* Also be aware of the restricted VM SKUs for AKS Cluster nodes https://docs.microsoft.com/en-us/azure/aks/quotas-skus-regions#service-quotas-and-limits. This is due to the required Kubernetes pods needed to run the cluster

There are also other topics that could affect the AKS cluster design:
* Multiple Node Pools - https://docs.microsoft.com/en-us/azure/aks/use-multiple-node-pools
* Cluster Autoscaler - https://docs.microsoft.com/en-us/azure/aks/use-multiple-node-pools
* Virtual Kubelet - https://docs.microsoft.com/en-us/azure/aks/virtual-kubelet

### Access and Identity & Cluster Isolation
Like any other cloud service, access to the resources should be well thought out on which teams and/or individuals will have access to the AKS cluster and their level of abilities to do functions on the cluster. In addition to cluster access, customers may choose to also provide logical boundaries within the cluster to isolate workloads and make them only accessible by certain teams and/or individuals.

> **SPEAKER NOTES**
* Kubernetes has an access concept of roles, clusters roles, and role bindings. These roles provide fine grain control of verb actions to the cluster API https://kubernetes.io/docs/reference/access-authn-authz/rbac/
* AKS can take advantage of Kubernetes cluster role with Azure AD Integration allowing customers to utilize user and/or group identities in Azure AD for access to the AKS cluster. https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-identity
* The use of Kubernetes Namespaces can be used to further logically separate access to the AKS cluster by only allowing roles to access particular Namespaces. https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-cluster-isolation

### Networking Considerations
There are two network models supported in AKS, Kubenet referred to as basic networking, and Azure CNI referred to as advanced networking. As mentioned earlier, it is recommended that customers choose the advanced networking model when possible for deploying AKS (Azure CNI). Basic networking (Kubenet) should be utilized more for development and testing. The key difference between the two network models is advanced networking will allow for each pod to obtain and IP address from the Azure virtual network, whereas basic networking the pods will obtain an address from an internal Kubernetes network and will not be routable to the Azure virtual network.

https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-network#choose-the-appropriate-network-model
https://docs.microsoft.com/en-us/azure/aks/concepts-network#azure-virtual-networks

When using advanced networking you will also need to plan the IP address space to consider cluster growth. Since advanced networking provides an IP address from the Azure virtual network to each pod created, the AKS agent nodes pre-allocate the number of IPs from the address space to equal the agent node max pod setting + 1. 

https://docs.microsoft.com/en-us/azure/aks/configure-azure-cni#plan-ip-addressing-for-your-cluster

### Storage Considerations
It is important to have a good understanding of the type of storage operations container pods will need. This will range from speed of access to concurrent reads and writes of multiple containers of pods spread throughout the cluster. 

https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-storage?view=azure-cli-latest

The following link use cases can help guide the discussion of  AKS storage needs https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-storage?view=azure-cli-latest#choose-the-appropriate-storage-type. 

Storage classes defines the tiers of storage and the reclaim policy of the pod. 
https://docs.microsoft.com/en-us/azure/aks/concepts-storage#storage-classes

> **SPEAKER NOTES**
* Currently Azure Files back storage is only available on the standard performance tier (HDDs)
* Premium disks are recommended for all production workloads
* BlobFuse can be used for a unstructured data solution https://github.com/Azure/azure-storage-fuse

## Deployment
For the POC deployment we will use the Azure portal deployment for AKS.

> **GUIDE** [Walkthrough: Create an AKS Cluster](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal#create-an-aks-cluster) 

> **SPEAKER NOTES**
* Use the Advanced Networking option for deployment
* Ensure a VNET subnet has been identified to install the AKS cluster nodes to
* Ensure the customer deploying the AKS cluster has the ability to create a service principle in the AAD tenant. The service principle can be pre-created prior to the deployment. 
* If using a pre-created service principle, ensure it has the Network Contributor role to the subnet the cluster will be deployed to
* You can choose to enable the Container Insights monitoring solution at the time of the cluster creation. Monitoring will be covered at a later section

A typical deployment should take around 10 minutes. Deployments with durations beyond 15 minutes are likely to fail. Please check the deployment messages to figure out any issues. Most common failed deployments issues involve a service principle without the correct delegated permissions, blocked internet outbound access to the agent nodes (this is due to Kubernetes infrastructure pods being pulled from internet repositories, and Azure Policies limiting deployments of VM SKUs and creation of load balancer and IPs.

## Operations
Once the deployment has completed connect to the cluster and deploy out a few applications.


1. Deploy the Azure Voting Application
> **GUIDE** [Walkthrough: Deploy the Azure Voting Application to the AKS cluster](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal#run-the-application) 

Often times a customer may want to expose thier application and/or API using a URI based path, along with the ability to have TLS. This can be accomplished using an Ingress Controller. 

2. Create an Ingress Controller and Deploy URI path based application
> **GUIDE** [Walkthrough: Create AKS Ingress Controller](https://docs.microsoft.com/en-us/azure/aks/ingress-basic)

> **SPEAKER NOTES**
* There is an additional walkthrough that shows how to create certificates for TLS [here](https://docs.microsoft.com/en-us/azure/aks/ingress-own-tls)
* There is also an Azure Application Gateway ingress controller integration with AKS. Documentation can be found [here](https://github.com/Azure/application-gateway-kubernetes-ingress) on GitHub. 


## Monitoring
There are several options available to monitor a Kubernetes cluster. For AKS, Azure Monitor provides an integrated platform solution known as Container Insights. 

### Azure Container Insights
> **SHOW** [Azure Monitor Container Insights Overview](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-overview)

> **GUIDE** [Walkthrough: Enabling Azure Monitor Container Insights from AKS Cluster](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-enable-existing-clusters#enable-directly-from-aks-cluster-in-the-portal)

> **SPEAKER NOTES**
* Once Container Insights is enabled, it may could take several minutes (up to and hour) for cluster data to start showing up in the dashboard. Analyzing the data with the customer may need an additional session. 

> **GUIDE** [Walkthrough: Analyze AKS Cluster Health](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-analyze)

> **GUIDE** [Walkthrough: Setup Alerting for AKS](https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-alerts)

> **SPEAKER NOTES**
* **AWARENESS**: Prometheus is a popular open-source monitoring solution that is frequently used to monitor Kubernetes clusters. Customers can find more information on Prometheus [here](https://prometheus.io/docs/introduction/overview/). A Prometheus AKS walkthrough is being discussed as IP for FTA.

## Business Continuity and Disaster Recovery
There are several considerations and architectural approaches for achieving a highly available for the AKS cluster. 

> **GUIDE** [Walkthrough: Best Practices for BC/DR for AKS](https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-multi-region)

> **SPEAKER NOTES**
* Our BC/DR best practice guide is not intended to answer all scenarios and possiblities concerning AKS HA. Utilize the guide to provide guidance to the customer on things to consider when thinking about keeping services resilient to both cluster and Azure region failures. 

Velero (formally known as Heptio ARK) is a open-source backup and restore solution for Kubernetes cluster. More information on Velero can be found on their GitHub repository [here](https://prometheus.io/docs/introduction/overview/). 



