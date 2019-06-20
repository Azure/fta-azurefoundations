# Azure Functions

## Serverless

Serverless computing is the abstraction of servers, infrastructure, and operating systems. Apps built with a serverless model do not need to provision or manage any servers, reducing the overhead of maintaining infrastructure. Serverless computing is driven by the reaction to events and triggers happening in near-real-time in the cloud.

As a fully managed service, server management and capacity planning are invisible to the developer and consumption is only charged for the time and resources it takes to execute code through sub-second billing.

The benefits of serverless computing include:
* Serverless compute scales from nothing to handle tens of thousands of concurrent functions almost instantly (within seconds), to match any workload, and without requiring scale configuration.
* By utilizing fully managed services, the focus is on business logic and not administrative tasks. With serverless architecture, it is a matter of simply deploying code and it runs with high availability.
* Reduce time to market by redirecting resources from infrastructure management into innovating and focusing on the business problems to solve.

## Functions Overview

Azure Functions are one solution available on the Azure platform to build and run serverless applications.

Ideal uses cases for functions are:
* Data processing (e.g. image processing or order processing, file maintenance, long-running tasks, scheduled tasks)
* System integration
* IoT systems
* Simple microservice APIs

Like other App Services, functions can be written in a variety of languages including C#, JavaScript, F#, Java, Python, and PHP. 

Functions allow you to listen and react to events across your stack with using computing resources on demand. For example, an HTTPTrigger can start running code either through a direct HTTP call or via a webhook from another service.

Functions can be integrated with Logic Apps as well both in terms of triggering a Logic App from a function or calling a function as part of a Logic App workflow.

> **GUIDE** [Functions Developer Guide](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference)

> **GUIDE** [Create your first function](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-azure-function)

## Platform and Scaling

You can run Azure Functions in three different modes:
* Consumption
* Premium
* Dedicated (App Service) Plan

The primary drivers for selecting which options are deciding how an app should be scaled, the amount of resources available to each instance of the app, and support for advanced features such as VNET integration.

### Consumption Plan

Functions running in a consumption plan automatically gets allocated compute power when code is running and scales out as load increases and back down again as the demand subsides.

With Consumption plan, billing is based on number of executions, execution time, and memory used. Charges accrue only when the code is actually running.

> **NOTE**
Function apps in the same region can be assigned to the same Consumption plan. There's no downside or impact to having multiple apps running in the same Consumption plan. Assigning multiple apps to the same consumption plan has no impact on resilience, scalability, or reliability of each app.

### Dedicated Plan

In the App Service plan, your function apps run on dedicated VMs on Basic, Standard, Premium, and Isolated SKUs, similar to other App Services. Since dedicated resources are allocated to your apps, the functions host will always be running.

Common scenarios that prompt the use of a dedicated plan instead of a consumption one include:
* There are existing App Services running that are underutilized
* A custom image is required to run a function app
* Functions need to run longer than the [time limits](https://docs.microsoft.com/en-us/azure/azure-functions/functions-scale#timeout) of a consumption plan
* A function needs more compute resources than is available in the consumption plan

### Premium Plan

Function running in a premium plan are a cross between consumption and app service plans. They automatically add instances based on demand similar to a consumption plan but includes additional capabilities such as:
* Avoiding cold starts
* VNET connectivity
* Unlimited execution duration

> **GUIDE** [Azure Functions scale and hosting](https://docs.microsoft.com/en-us/azure/azure-functions/functions-scale)

## Durable Functions

Durable Functions are an extension of Azure Functions that lets you write stateful functions in a serverless environment. The extension manages state, checkpoints, and restarts for you.

Durable functions are useful for a variety of application patterns including:
* Chaining
* Fan-out / fan-in
* Async HTTP APIs
* Monitoring
* Human interaction

There are three types of functions involved in a durable function:
* **Activity functions**: These functions execute the business logic of the function, such as handling a process order, charging a credit card, creating a shipping notice, etc.
* **Orchestrator functions**: These coordinate the specific activity functions that are called and handle state between different functions. Also orchestrator functions can call other orchestrators.
* **Client functions**: These are the entry points to creating a new durable function orchestration. They can be triggered from an source such as HTTP triggers, queue messages, event streams, etc.

> **GUIDE** [Durable functions types and features](https://docs.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-types-features-overview)

> **GUIDE** [Create a durable function in C#](https://docs.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-create-first-csharp)

> **GUIDE** [Durable functions patterns](https://docs.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-concepts)

## Architecture Patterns

> **GUIDE** [Serverless web application on Azure](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/serverless/web-app)

> **GUIDE** [Serverless event processing using Azure Functions](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/serverless/event-processing)
