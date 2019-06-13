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
•	Multiple Node Pools - https://docs.microsoft.com/en-us/azure/aks/use-multiple-node-pools
•	Cluster Autoscaler - https://docs.microsoft.com/en-us/azure/aks/use-multiple-node-pools
•	Virtual Kubelet - https://docs.microsoft.com/en-us/azure/aks/virtual-kubelet

### Access and Identity & Cluster Isolation
Like any other cloud service, access to the resources should be well thought out on which teams and/or individuals will have access to the AKS cluster and their level of abilities to do functions on the cluster. In addition to cluster access, customers may choose to also provide logical boundaries within the cluster to isolate workloads and make them only accessible by certain teams and/or individuals.

> **SPEAKER NOTES**
