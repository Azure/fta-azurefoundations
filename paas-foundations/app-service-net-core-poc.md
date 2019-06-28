## Contoso Expenses 
A .Net Core Multi-Tier PaaS Sample App

## Prerequisites
* To complete the Proof of Concept, you will need:
    * A Microsoft Azure subscription (with Owner or Contributor access)

    * Install latest version of [Visual Studio 2017](https://www.visualstudio.com/downloads/) Enterprise with following Workloads:
      * .NET desktop development 
      * ASP.NET and web development 
      * Azure development  
      * Data storage and processing 
    
    * Download latest SQL Server Management Studio [here](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms) and install:
    
    * Download Proof-of-concept project from [here](https://demowebst.blob.core.windows.net/code/ContosoCoreProject.zip)

## Planning
| |Resource Type | Your Name | Name Used in this POC | Description |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| |  Resource Group|   | conexp | The name of the Azure resource group that contains all the required resources of the application we’ll deploy to Azure|
| |  App Service Plan|   | conexpplan | The name of the application service plan, which hosts the virtual ‘hardware’ for the App Service offerings we’ll use (API, Web App, Function)|
| |  Web app|   | conexpweb | The name of your main website |
| |  API App|   | conexpapi | The name of the API your website will call to get cost center information |
| |  SQL Server|   | conexpsql | The name of the SQL server that will host the expenses database |
| |  SQL DB|   | Db1 | The name of the database that will contain the Expense table |
| |  Azure Function |   | conexpfn | The name of the Azure Function that will monitor a queue, trigger on expenses placed on the queue, and send an email to the approver containing the expense information |
| |  Storage account |   | conexpstore | The name of the storage account that will be used by the function and to host a queue |
| | Azure Region |   | Central US | The Azure region that you’d like your resources to be created in, which is the geographic location of the datacenter used to host them |

## Solution Workflow

## Infrastructure Creation
### Introduction

### Creating Resources

### Create the Resource Group

### Reference
 Resource Group Documentation -- Inject a Link
 
 ### Create the App Service Plan
 
  ### Reference
  App Service Plan Documentation -- Inject a Link
 
 ### Create the Web and API Apps
 
  ### Reference
  Web App Documentation -- Inject a Link
 
 ### Create the Azure Function
 
  ### Reference
  Function App Documentation -- Inject a Link
  
  ### Reference
 SQL Database documentation -- -- Inject a Link
 
  #### SendGrid Account

### Code Deployment
## Deploy the Web and API Apps

## NOTE START HERE FOR THE REMAINING SCREEN SHOTS FOR THE POC

## Deploy the Function App

## Deploy the Database

## Configuration
### Configure the Azure Function


### Configure the Web App




