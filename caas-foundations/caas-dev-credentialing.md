
# FastTrack for Azure - CaaS Developer Credentialing  
The credentialing process for FastTrack Engineers looking to pursue the CaaS developer credential 

The goal of the CaaS Developer Credentialing is to quickly verify and/or identify areas of growth to focus your development and learnings. The Service leads want to ensure there is a consistent credentialing experience that ensures the engineer can confidently deliver Container engagements.

## Credentialing Process
The credentialing process for CaaS Infrastructure will be partially performance based. This means the facilitator will ask questions to the engineer on how to accomplish a task and the engineer will actively work through the task either through the portal, CLI, or both. Due to the fact that this credentialing process is partially performance based, this means that the credentialing appointment will need both participants available to attend a screen share. 

<!-- ### Credentialing Session Requirements
When you feel that you are familiar and comfortable with the credentialing topics and curriculum, please feel free to contact the service lead to schedule your credentialing session. Please also make sure the following requirments have been met.

- Familiarize yourself with the credentialing curriculum topics
- Identify one of the service leads to conduct the credentialing session
- Ensure you have a running 3-node AKS cluster (RBAC enabled) available to work on during the session
- Ensure you have an Azure Container Registry that can access the AKS cluster
- Ensure you have the Azure Monitor Container Insights solution deployed to the AKS cluster
- Ensure you have an Azure Container Instance service deployed
- Ensure you have **1 hour** scheduled of uninterruptable time dedicated to the credentialing session -->
### Docker Credentialing Curriculum

#### Containerization Fundementals

#### Creating and running Images to debug locally

#### Dockerfile best practices
- Understand Dockerfile syntax
  - https://docs.docker.com/engine/reference/builder/
- Understand Dockerfile recommended practices
  - https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
- Understand multi-stage build patterns
  - https://medium.com/@tonistiigi/advanced-multi-stage-build-patterns-6f741b852fae

### Kubernetes Credentialing Curriculum

#### Core Concepts
- Understand Kubernetes API primitives
- Create and configure basic Pods
  
#### Configuration
- Understand ConfigMaps
- Understand SecurityContexts
- Define an application's resource requirements
- Create & consume Secrets
- Understand Service Accounts
  
#### Multi-Container Pods
- Understand Multi-Container Pod design patterns (e.g. ambassador, adapter,sidecar)
  
#### Observability
- Understand LivenessProbes and ReadinessProbes
- Understand container logging
- Understand hot to monitor applications in Kubernetes
- Understand debugging in Kubernetes

#### Pod Design
- Understand how to use Labels, Selectors, and Annotations
- Understand Deployments and hot to perform rolling updates
- Understand Deployments and hot to perform rollbacks
- Understand Jobs and CronJobs

#### Servics & Networking
- Understand Services
- Demonstrate basic understanding of NetworkPolicies

#### State Persistence
- Understand PersitentVolumeClaims for storage

#### Azure Container Registry
Azure Container Registry is a managed Docker registry service based on the open-source Docker Registry 2.0. Create and maintain Azure container registries to store and manage your private Docker container images.

https://docs.microsoft.com/en-us/azure/container-registry/container-registry-intro

#### Development using Azure Container Instances

#### Azure AKS Dev Spaces
 With minimal dev machine setup, you can iteratively run and debug containers directly in Azure Kubernetes Service (AKS).  You can also collaborate with your team in a shared Kubernetes cluster, and do end-to-end testing with other components without replicating or mocking up dependencies. With Azure Dev Spaces, you can develop on Windows, Mac, or Linux using familiar tools like Visual Studio, Visual Studio Code, or the command line. 

https://docs.microsoft.com/en-us/azure/dev-spaces/

#### Draft

#### Brigade

#### Helm

#### VSCode Integrations




