
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
-- https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/microservices/aks