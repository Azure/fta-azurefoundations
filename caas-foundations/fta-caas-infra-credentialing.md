
# FastTrack for Azure - CaaS Infrastructure Credentialing  
The credentialing process for FastTrack Engineers looking to pursue the CaaS infrastructure credential will be semi-modeled after the [Cloud Native Computing Foundation's](https://www.cncf.io/) [Certified Kubernetes Administrator's](https://www.cncf.io/certification/cka/) exam, with the omission of topics surrounding bootrapping of Kubernetes clusters. Additional topics and focus on the Azure platform and Azure container services such as AKS, ACR, and ACI will be added. 

You can view the curriculum for the CKA exam [here](https://github.com/cncf/curriculum).

> **PLEASE NOTE: In no way is the CaaS Infrastructure credentialing process associated with the Cloud Native Computing Foundation's Certified Kubernetes Administrator's exam. Those who have taken CNCF exams are under strict NDA guidelines that prohibit any tester from sharing details about the exam. The alignment to the certification curriculum is only used as a guide for skills nececessary to support FTA engagements. Also, the FastTrack for Azure service leads makes no claim that aquiring the Caas Infrastructure credential provides the ability to pass the CKA exam.** 

## Credentialing Process
Similar to the CKA exam, the credentialing process for CaaS Infrastructure will be partially performance based. This means the facilitator will ask questions to the engineer on how to accomplish a task and the engineer will actively work through the task either through the portal, CLI, or both. Due to the fact that this credentialing process is partially performance based, this means that the credentialing appointment will need both participants available to attend a screen share. 

### Credentialing Session Requirements
When you feel that you are familiar and comfortable with the credentialing topics and curriculum, please feel free to contact the service lead to schedule your credentialing session. Please also make sure the following requirments have been met.

- Familiarize yourself with the credentialing curriculum topics
- Identify one of the service leads to conduct the credentialing session
- Ensure you have a running 3-node AKS cluster (RBAC enabled) available to work on during the session
- Ensure you have an Azure Container Registry that can access the AKS cluster
- Ensure you have the Azure Monitor Container Insights solution deployed to AKS cluster
- Ensure you have **1 hour** scheduled of uninteruptable time dedicated to the credentialing session

### Credentialing Curriculum


#### Installation, Configuration, & Validation

- Design a Kubernetes cluster
  - https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/microservices/aks
- ~~Install Kubernetes master and nodes~~
- ~~Configure secure cluster communications~~
- Configure a Highly-Available Kubernetes cluster
  - https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-multi-region
- ~~Know where to get the Kubernetes release binaries~~
- ~~Provision underlying infrastructure to deploy a Kubernetes cluster~~
- Choose a network solution
  - https://docs.microsoft.com/en-us/azure/aks/configure-kubenet
  - https://docs.microsoft.com/en-us/azure/aks/configure-azure-cni
- Choose your Kubernetes infrastructure configuration
- Run end-to-end test on your cluster
- Analyze end-to-end tests results
- Run Node end-to-end tests
  - https://docs.microsoft.com/en-us/azure/aks/kube-advisor-tool?view=azure-cli-latest
  
#### Cluster
- Understand Kubernetes cluster upgrade process
  - https://docs.microsoft.com/en-us/azure/aks/upgrade-cluster
- Facilitate operating system upgrades
  - https://docs.microsoft.com/en-us/azure/aks/node-updates-kured
- Implement backup and restore methodologies
  - https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-storage
  - https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-storage#secure-and-back-up-your-data
  
#### Networking
   - https://docs.microsoft.com/en-us/azure/aks/concepts-network
   - https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-network
   - https://docs.microsoft.com/en-us/azure/aks/use-network-policies

- Understand the networking configuration on the cluster nodes
- Understand Pod networking concepts
- Understand service networking
- Deploy and configure network load balancer
  - https://docs.microsoft.com/en-us/azure/aks/internal-lb
- Know how to use Ingress rules
  - https://docs.microsoft.com/en-us/azure/aks/ingress-basic
- Know how to configure and use the cluster DNS
  - https://docs.microsoft.com/en-us/azure/aks/coredns-custom
- Understand CNI
  - https://docs.microsoft.com/en-us/azure/aks/configure-kubenet
  - https://docs.microsoft.com/en-us/azure/aks/configure-azure-cni
  
#### Storage
  
