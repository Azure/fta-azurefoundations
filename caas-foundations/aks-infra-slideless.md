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
