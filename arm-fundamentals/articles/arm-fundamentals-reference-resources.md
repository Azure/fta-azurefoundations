# Azure Resource Manager (ARM) Fundamentals - Reference Resources

If you have been through our ARM Fundamentals session, thank you! Please find below some extra documentation and articles which may be useful when designing your ARM Templates.

If you have not been through our session, why not consider getting in touch with your Program Manager or lead engineer, to determine if using ARM Templates is a fit for your project's aims?

## Module 1 – ARM Template Fundamentals Overview

* [Understand the structure and syntax of Azure Resource Manager templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)

    > Remember the key components of an Azure Resource Manager Template; Schema, Content Version, Parameters, Variables, Resources and Outputs. Remember that a Resource Group is a logical container and represents the lifecycle of a set of resources or is a management boundary for those resources.
    
* [Azure Quickstart Templates](https://github.com/azure/azure-quickstart-templates)
* [Deploy resources with Resource Manager templates and Azure PowerShell](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-template-deploy#incremental-and-complete-deployments)

    > In the session, we deploy the [vNet with two subnets quick start template](https://github.com/Azure/azure-quickstart-templates/tree/master/101-vnet-two-subnets), and show the structure of an Azure Resource Manager Template. We also looked through the deployment options (Incremental vs Complete) and some of the deployment approaches (PowerShell, and Azure UI). 

* [Create and deploy your first Azure Resource Manager template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-create-first-template)

    > You can follow this guide, as an example of creating your first Azure Resource Manager template. This shows an example of creating a storage account in a particular region.

* We discussed two options for creating Azure Resource Manager Templates; 

    * [Use Visual Studio Code extension to create Azure Resource Manager template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-vscode-extension)

        > Visual Studio Code is a lightweight code editor that has an Azure Resource Manager extension that helps you in creating templates.
    
    * [Creating and deploying Azure resource groups through Visual Studio](https://docs.microsoft.com/en-us/azure/azure-resource-manager/vs-azure-tools-resource-groups-deployment-projects-create-deploy)

        > Visual Studio is another option, and contains some built-in tooling in helping you create templates. The latest version of Visual Studio also has integration to leverage the Azure Quick start Templates.

## Module 2 – Functions and Dependencies

* [Azure Resource Manager template functions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-template-functions)

    > Remember that you can use functions in Azure Resource Manager Templates to create standardised or more complex templates. For example **concat** could be used to concatenate resource names with parameters, such as an organisational or environment prefix.

* [Define the order for deploying resources in Azure Resource Manager templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-define-dependencies)

    > Remember that for a given resource, there can be other resources that must exist before the resource is deployed (also known as an explicit dependency, using the dependsOn element). Also note that there are implicit dependencies which can use  the reference function.

* [Set name and type for child resource in Resource Manager template](https://docs.microsoft.com/en-gb/azure/azure-resource-manager/resource-manager-templates-resources)

    > When creating a template, you may need to include a child resource that is related to a parent resource. As an example, we used the scenario that a template may include a SQL server and a database. It is also worth highlighting the article on how to [Create multiple instances of a child resource](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-multiple#create-multiple-instances-of-a-child-resource).


## Module 3 – Multiple Instances

* [Deploy multiple instances of a resource or property in Azure Resource Manager templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-multiple)

    > This documentation walks you through deploying multiple instances of a given resource, using a loop. Remember that Azure Resource Manager will deploy resources in parallel by default, but you can deploy multiple instances in a serial mode and set a batch size.
    
    > For example, if creating 5 instances with a batch size of 2, we would loop through 3 times to create those 5 resources).
    
    > Additionally, we also discussnote that you can depend resources on the completion of a loop.


## Module 4 – Nested ARM Templates

* [Using linked templates when deploying Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-linked-templates)

    > This article walks you through the steps to deploy a linked template from a parent template. Remember that there are numerous approaches for deploying resources; deploying all resources into one resource group from one template, deploying resources into one resource group from multiple linked templates, deploying resources across multiple resources groups using multiple templates. You should determine the most appropriate to you, based upon the lifecycle and management boundaries of those resources.


## Module 5 – Recommended Practices

* [Best practices for creating Azure Resource Manager templates](https://docs.microsoft.com/en-gb/azure/azure-resource-manager/resource-group-authoring-templates)

* [Design patterns for Azure Resource Manager templates when deploying complex solutions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/best-practices-resource-manager-design-templates)
