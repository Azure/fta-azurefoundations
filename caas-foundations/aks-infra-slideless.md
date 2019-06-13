# Azure Kubernetes Service (AKS)  
In this slide-less delivery for AKS, we will talk through with the customer on requirements, decisions, and the necessary information they will need to deploy an AKS cluster for a POC engagement. 

## AKS Concepts
If the customer is completely new to Kubernetes and the AKS service, it may make sense to go over some of the basic concepts and understandings for AKS. The Kubernetes core concepts for AKS page is a good start to introduce the customer to the AKS service.

https://docs.microsoft.com/en-us/azure/aks/concepts-clusters-workloads

> **SPEAKER NOTES**

Some frequent questions asked about the AKS service are:
  1. What is the architecture of the master nodes?
    a.	Explain to the customer that AKS is a platform managed Kubernetes service and should be considered like all other PaaS services            on Azure. There are no specific hardware specification to share and the service will scale to the customer needs. 
