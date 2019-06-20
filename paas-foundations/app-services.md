# App Services

## Introduction

When it comes to Azure PaaS there are many different ways to build & deploy applications on Azure. Azure App Services, Service Fabric, Azure Functions, Azure Container Service, etc.

App Services are a High productivity & Fully Managed [Platform-as-a-Service](paas-overview.md) offering in Azure.

### Benefits

* **AAD Integration**: App Services support Azure Active Directory authentication which integrates with on-premises Active Directory and provides support for OAuth, OpenID connect, and SAML.

* **Global data center footprint**: App Services are deployed in all Azure regions worldwide so apps can sit close to where end users may be.

* **Hybrid Support**: Applications may have parts that continue to exist on-premise such as databases or ERP systems. App Services supports multiple hybrid connectivity options like VNET Integration, Hybrid Connections, or running in an App Service Environment.

* **Secure + Compliant**: App Services are compliant across a number of industry standards such as: ISO, SOC, PCI DSS, HITRUST, HIPPA, FedRAMP, etc.

* **High Availability with auto-patching**: App Services as a managed service are maintained and patched for you. 

* **Auto Scale and load balancing**: App Services has built in auto scale and load balancing.

* **Staging and deployment**:  App Services enables the use of deployment slots. A common question is when a new version of an applications is ready to go to production how does that get rolled out and if needed, switch back to a known good version if something goes wrong. Deployment slots allow developers to create new version of code in a staging slot and pushing code 20 or 30 times a day, without impacting a production deployment. Once ready, the slot can be swapped to production. 

* **Testing in Production**: With the use of deployment slots, a percentage of random production traffic to staging slots to make sure everything works as expected to provide an additional level of validation before pushing to production.

https://azure.microsoft.com/en-us/services/app-service/web/

https://docs.microsoft.com/en-us/azure/app-service/web-sites-integrate-with-vnet

https://docs.microsoft.com/en-us/Azure/azure-monitor/platform/autoscale-get-started?toc=%2fazure%2fapp-service%2ftoc.json

https://docs.microsoft.com/en-us/azure/app-service/deploy-staging-slots

> **NOTES**
App Services are not VMs that can be domain-joined so legacy authentication in an application may have to be adjusted to support modern auth implementations.

> **GUIDE** [Create an ASP.NET Core web app in Azure](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-get-started-dotnet)

> **GUIDE** [Upload and bind SSL certificates to App Services](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-custom-ssl)

> **GUIDE** [Map an existing custom DNS name to App Services](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-custom-domain)

## App Service Plans

### Plans

In App Service, an app runs in an App Service plan which is a set of compute resources for a Web app or API App to run. An app service plan can run one or more apps but an app can only be associated with a single app service plan.

When an app service plan is created, a set of compute resources is allocated for that plan in that region. Whatever apps are placed in that plan share the same underlying compute resources.

Each App Service plan defines:
* Region (West US, East US, West Europe, etc.)
* Number of VM instances
* Size of VM instances (Small, Medium, Large)
* [Pricing tier](#pricing) (Free, Shared, Basic, Standard, Premium, PremiumV2, Isolated, Consumption)

> **NOTES**
In terms of scaling app services and an application that may have a web front end and an API, a best practice is to host your Web app and API app in two different plans so they can be scaled them independently of each other.

https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans


### Pricing

App service plans have 6 pricing tiers: Free, Shared, Basic, Standard, Premium, and Isolated.

Standard and Premium plans are for production workloads and run on dedicated Virtual Machine instances behind the scenes

Each tier can support multiple applications and domains. The Isolated plan hosts apps in a private, dedicated Azure environment and is ideal for apps that require secure connections with your on-premises network. The isolated instances are meant to run in an App Service Environment.

The numbers of apps that can be hosted, the disk space, and the number of instances it supports changes depending on the size of the plan.

> **NOTES** All tiers except Free and Shared tiers support a 99.95% SLA

https://azure.microsoft.com/en-us/pricing/details/app-service/windows/


## Publishing Methods

There are multiple ways to deploy to App Services.

* [Zip / WAR](https://docs.microsoft.com/en-us/azure/app-service/deploy-zip)
* [FTP](https://docs.microsoft.com/en-us/azure/app-service/deploy-ftp)
* [Dropbox / OneDrive](https://docs.microsoft.com/en-us/azure/app-service/deploy-content-sync)
* [CI / CD](https://docs.microsoft.com/en-us/azure/app-service/deploy-continuous-deployment)
* [Local Git](https://docs.microsoft.com/en-us/azure/app-service/deploy-local-git)
* [From a template](https://docs.microsoft.com/en-us/azure/app-service/deploy-complex-application-predictably)

## Deployment Slots

Deployment slots allow staging of code to test and validate before pushing to production via a slot-swap. Not all settings are going to be swapped between slots, as such planning needs to happen if any of these settings are vital for the different staging environments.

| Swapped Settings | Non-Swapped Settings |
| - | - |
| General settings (framework version, 32/64 bit, web sockets) | Publishing endpoints |
| App settings | Custom domain names |
| Connection strings | SSL certificates |
| Handler mappings | Scale settings
| Monitoring and diagnostics | Web jobs schedulers |
| Web jobs content | |

Application settings and connection strings can be configured to be sticky between slots. These allow a specific value, e.g. a database connection string, to stay locked to a specific slot which will prevent it being swapped to the wrong environment.

> **GUIDE** [Set up staging environments in App Services](https://docs.microsoft.com/en-us/azure/app-service/web-sites-staged-publishing)

## Diagnostics and Monitoring

### Diagnostics
App Service provides built-in diagnostics to assist with debugging and troubleshooting.

There are four kinds of logs that can be enabled via the Azure portal.

* **Web Server Logging**: IIS logs, gives information about HTTP requests and responses using W3C extended log file format.
* **Detailed Error Logging**: Detailed error information for HTTP status codes that indicate a failure (status code 400 or greater) 
    * This may contain information that can help determine why the server returned the error code.
* **Failed Request Tracing**: Detailed information on failed requests, including a trace of the IIS components used to process the request and the time taken in each component. 
* **Application Logging**: Collects diagnostics traces from web app code.

> **NOTES** 
By default all the loggings are *Off* and can be turned on as needed.

When the logs are enabled, they can be stored in either the Filesystem on the VM or in a storage account. And FTP client or the Kudu console can be used to access logs stored on the filesytem.

### Monitoring

App Services provides built in monitoring functionality via the Azure portal. This includes the ability to review quotas and metrics for an app as well as the App Service plan. In addition, monitoring collects the number of requests to an app, average response time, HTTP server errors, data in & out.

Application Insights can be used to instrument an app and send telemetry to Azure to analyze how it is being used, the number of users including where they are coming from, what devices they are using, and what features they are using in your app.

### Alerts

Alerts can also be setup via portal. Metrics for the app or plan can be connected to alerts and to provide email notifications for when they trigger.

For example alerts can notify when average response time of an app goes above 2 seconds or CPU usage goes above 75% or when server errors start getting triggered.

> **GUIDE** [Enable diagnostics logging for apps in App Services](https://docs.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs)
> **GUIDE** [Monitor apps in App Services](https://docs.microsoft.com/en-us/Azure/app-service/web-sites-monitor)

## API Apps

There are additional benefits to running API applications in an App Service:
* **Bring an existing API as-is**: No changes required to the existing API code is needed to take advantage of Azure API Apps features
* **Simple access control**: Provides built-in authentication services support for Azure Active Directory or social network single sign-on such as Facebook and Twitter again with no code changes required.
* **From a Swagger metadata perspective**: Integrated Swagger support makes APIs easily consumable by a variety of clients. The API Apps SDK can generate client code for an API in a variety of languages including C#, Java, and JavaScript.
* **Integration with Logic Apps & API management**: API apps can be easily consumed by Logic Apps or API Management.

### Swagger

Swagger is a standard, language-agnostic interface to REST APIs which allows both humans and computers to discover and understand the capabilities of the service without access to source code, documentation, or through network traffic inspection.

For more details: 
* http://swagger.io/ 
* http://swagger.io/getting-started-with-swagger-i-what-is-swagger/ 

The Swagger spec on GitHub contains links to a variety of  third-party projects that help you with Swagger doc generation in different environments. For .NET Framework developers, Swashbuckle is a project for documenting ASP.NET Web API projects with Swagger.

In simple terms Swashbuckle is a NuGet package to generate Swagger. In addition to its Swagger generator, Swashbuckle also contains an embedded version of swagger-ui which it will automatically serve up once Swashbuckle is installed.

https://github.com/domaindrivendev/Swashbuckle.AspNetCore

> **GUIDE** [Host a RESTful API with CORS in App Services](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-rest-api)

> **GUIDE** [Authentication and authorization in App Services](https://docs.microsoft.com/en-us/azure/app-service/overview-authentication-authorization)