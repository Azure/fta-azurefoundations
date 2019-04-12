
# FastTrack for Azure - CaaS Infrastructure Credentialing  
The credentialing process for FastTrack Engineers looking to pursue the CaaS infrastructure credential will be semi-modeled after the [Cloud Native Computing Foundation's](https://www.cncf.io/) [Certified Kubernetes Administrator's](https://www.cncf.io/certification/cka/) exam, with the omission of topics surrounding bootrapping of Kubernetes clusters. Additional topics and focus on the Azure platform and Azure container services such as AKS, ACR, and ACI will be added. 

You can view the curriculum for the CKA exam [here](https://github.com/cncf/curriculum).

The goal of the CaaS Infrastructure Credentialing is to quickly verify and/or identify areas of growth to focus your development and learnings. The Service leads want to ensure there is a consistent credentialing experience that ensures the engineer can confidently deliver Container engagements.

> **PLEASE NOTE: In no way is the CaaS Infrastructure credentialing process associated with the Cloud Native Computing Foundation's Certified Kubernetes Administrator's exam. Those who have taken CNCF exams are under strict NDA guidelines that prohibit any tester from sharing details about the exam. The alignment to the certification curriculum is only used as a guide for skills nececessary to support FTA engagements. Also, the FastTrack for Azure service leads makes no claim that aquiring the Caas Infrastructure credential provides the ability to pass the CKA exam.** 

## Credentialing Process
Similar to the CKA exam, the credentialing process for CaaS Infrastructure will be partially performance based. This means the facilitator will ask questions to the engineer on how to accomplish a task and the engineer will actively work through the task either through the portal, CLI, or both. Due to the fact that this credentialing process is partially performance based, this means that the credentialing appointment will need both participants available to attend a screen share. 

### Credentialing Session Requirements
When you feel that you are familiar and comfortable with the credentialing topics and curriculum, please feel free to contact the service lead to schedule your credentialing session. Please also make sure the following requirments have been met.

- Familiarize yourself with the credentialing curriculum topics
- Identify one of the service leads to conduct the credentialing session
- Ensure you have a running 3-node AKS cluster (RBAC enabled) available to work on during the session
- Ensure you have an Azure Container Registry that can access the AKS cluster
- Ensure you have the Azure Monitor Container Insights solution deployed to the AKS cluster
- Ensure you have an Azure Container Instance service deployed
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
   - https://docs.microsoft.com/en-us/azure/aks/concepts-storage?view=azure-cli-latest 
   - https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-storage?view=azure-cli-latest
- Understand persistent volumes and know how to create them
- Understand persistent volume claims primitive
- Understand Kubernetes storage objects
- Know how to configure applications with persistent storage

#### Core Concepts
- Understand the Kubernetes API primitives
- Understand the Kubernetes cluster architecture
  - https://docs.microsoft.com/en-us/azure/aks/concepts-clusters-workloads
- Understand Services and other network primitives

#### Scheduling
   - https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-scheduler
   - https://docs.microsoft.com/en-us/azure/aks/operator-best-practices-advanced-scheduler
- Use label selectors to schedule Pods
  - https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/
- Understand the role of DaemonSets
  - https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
- Understand how resource limits can affect Pod scheduling
  - https://kubernetes.io/docs/concepts/policy/resource-quotas/
  - https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/
  - https://kubernetes.io/docs/tasks/configure-pod-container/assign-cpu-resource/
- Understand how to run multiple schedulers and how to configure Pods to use them
  - https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/
- Manually schedule a pod without a scheduler
- Display scheduler events
- Know how to configure the Kubernetes scheduler

#### Logging and Monitoring
- Understand how to monitor all cluster components
  - https://docs.microsoft.com/en-us/azure/azure-monitor/insights/container-insights-overview
- Understand how to monitor applications
- Manage cluster component logs
  - https://docs.microsoft.com/en-us/azure/aks/view-master-logs
- Manage application logs

#### Application Lifecycle Management
- Understand Deployments and how to perform rolling updates and rollbacks
  - https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-deploy-application#deploy-the-application
- Know various ways to configure applications
- Know how to scale applications
  - https://docs.microsoft.com/en-us/azure/aks/tutorial-kubernetes-scale
- Understand the primitives necessary to create a self-healing application

#### Security
- Know how to configure authentication and authorization
- Understand Kubernetes security primitives
- Know to configure network policies
  - https://docs.microsoft.com/en-us/azure/aks/use-network-policies
- ~~Create and manage TLS certificates for cluster components~~
- Work with images securely
  - https://docs.microsoft.com/en-us/azure/container-registry/container-registry-content-trust
- Define security contexts
- Secure persistent key value store

#### Troubleshooting
- https://docs.microsoft.com/en-us/azure/aks/troubleshooting
- Troubleshoot application failure
- Troubleshoot control plane failure
- Troubleshoot worker node failure
- Troubleshoot networking

#### Azure AKS Engine
AKS Engine provides convenient tooling to quickly bootstrap Kubernetes clusters on Azure. By leveraging ARM (Azure Resource Manager), AKS Engine helps you create, destroy and maintain clusters provisioned with basic IaaS resources in Azure. AKS Engine is also the library used by AKS for performing these operations to provide managed service implementations.

https://github.com/Azure/aks-engine

- AKS Engine Tutorial
  - https://github.com/Azure/aks-engine/tree/master/docs/tutorials

#### Azure Container Registry
Azure Container Registry is a managed Docker registry service based on the open-source Docker Registry 2.0. Create and maintain Azure container registries to store and manage your private Docker container images.

https://docs.microsoft.com/en-us/azure/container-registry/container-registry-intro

#### Azure Container Instances
Azure Container Instances is a great solution for any scenario that can operate in isolated containers, including simple applications, task automation, and build jobs. For scenarios where you need full container orchestration, including service discovery across multiple containers, automatic scaling, and coordinated application upgrades, we recommend Azure Kubernetes Service (AKS).

https://docs.microsoft.com/en-us/azure/container-instances/container-instances-overview

#### Azure Kubernetes Service FAQ
Please familiarize yourself with the AKS FAQ.
- https://docs.microsoft.com/en-us/azure/aks/faq


