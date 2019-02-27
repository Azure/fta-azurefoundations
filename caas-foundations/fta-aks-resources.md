
# FastTrack for Azure AKS Resources 
This page is to provide all the details surrounding AKS. //WIP

## Networking Solutions
| Product | Scenario | Documentation | FTA Readiness Resource Page |
| ------------- | ------------- | ------------- | ------------- |
| AKS Network Policies | When you run modern, microservices-based applications in Kubernetes, you often want to control which components can communicate with each other | https://docs.microsoft.com/en-us/azure/aks/use-network-policies | //WIP |

## Ingress Solutions
| Product | Scenario | Documentation | FTA Readiness Resource Page |
| ------------- | ------------- | ------------- | ------------- |
| AKS App Gateway Ingress Controller | The Application Gateway Ingress Controller allows the Azure Application Gateway to be used as the ingress for an AKS cluster | https://github.com/Azure/application-gateway-kubernetes-ingress | //WIP |
| Envoy Proxy | Envoy is an L7 proxy and communication bus designed for large modern service oriented architectures | https://www.envoyproxy.io/docs/envoy/latest/intro/intro | //WIP |


## Storage Solutions
| Product | Scenario | Documentation | FTA Readiness Resource Page |
| ------------- | ------------- | ------------- | ------------- |
Azure Disks | A persistent volume can be used by one or many pods, and can be dynamically or statically provisioned. | https://docs.microsoft.com/en-us/azure/aks/azure-disks-dynamic-pv | //WIP |
Azure Files | If multiple pods need concurrent access to the same storage volume, you can use Azure Files to connect using the Server Message Block (SMB) protocol. | https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv | //WIP |
blobfuse | This driver allows Kubernetes to access virtual filesystem backed by the Azure Blob storage. | https://github.com/Azure/kubernetes-volume-drivers/tree/master/flexvolume/blobfuse | //WIP |
Minio | Minio is a high performance distributed object storage server, designed for large-scale private cloud infrastructure. | https://www.minio.io/ | //WIP |
GlusterFS | gluster-kubernetes is a project to provide Kubernetes administrators a mechanism to easily deploy GlusterFS as a native storage service onto an existing Kubernetes cluster. | https://github.com/gluster/gluster-kubernetes | //WIP |

## Service Mesh
| Product | Scenario | Documentation | FTA Readiness Resource Page |
| ------------- | ------------- | ------------- | ------------- |
| Istio | | https://istio.io/docs/concepts/what-is-istio/ | //WIP |
| Consul | A distributed service networking layer to connect, secure and configure applications across dynamic, distributed infrastructure. | https://www.consul.io/docs/ | //WIP |
| Linkerd | Linkerd gives you observability, reliability, and security for your microservices - with no code change required. |  https://linkerd.io/  | //WIP |

## Monitoring
| Product | Scenario | Documentation | FTA Readiness Resource Page |
| Azure Monitor | | |
| Prometheus | | | 

## Security
