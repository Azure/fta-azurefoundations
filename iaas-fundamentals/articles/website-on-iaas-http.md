# Walkthrough: Deploying Website on Azure IaaS VMs

## Table of Contents

  * [Introduction](#introduction)
  * [Learning objectives](#learning-objectives)
  * [Prerequisites](#prerequisites)
  * [Estimated time to complete this module](#estimated-time-to-complete-this-module)
  * [Customize your Azure Portal](#customize-your-azure-portal)
  * [Resource Group creation](#resource-group-creation)
  * [Virtual Network Creation](#virtual-network-creation)
  * [Virtual Machine Creation](#virtual-machine-creation)
  * [Install IIs on the VMs](#install-iis-on-the-vms)
  * [Load Balancer Creation](#load-balancer-creation)
  * [Add the VMs to Load Balancer](#add-the-vms-to-load-balancer)
  * [Create the load balancing rule for HTTP](#create-the-load-balancing-rule-for-http)
  * [Update the NSG (inbound security rule)](#update-the-nsg-inbound-security-rule)
  * [Assign DNS name to Load Balancer](#assign-dns-name-to-load-balancer)
  * [Testing](#testing)
  * [Automation Scripts (ARM Template)](#automation-scripts-arm-template)
  * [Visualize your Architecture with ArmViz](#visualize-your-architecture-with-armviz)


# Introduction

  This walkthrough will show you how to bring together all the infrastructure components to build a sample application and making it scalable, highly available and secure.

  ![Screenshot](media/website-on-iaas-http/poc-iaas-scenario-01.png)


# Learning objectives

  After completing the exercises in this walkthrough, you will be able to:
  * Create a Resource Group
  * Create a Virtual Network
  * Create multiple virtual machines
  * Create and setup a load balancer
  * Create an availability set for VMs
  * Update Network Security Groups(NSG)
  * Deploy a website


# Prerequisites 

  * Be familiar with the fundamentals of Azure Networking
  * Be familiar with the fundamentals of Azure Storage
  * Be familiar with the fundamentals of Azure Compute
  * Review [Reference Resources](iaas-fundamentals-reference-resources.md) if nedded.


# Estimated time to complete this module

  Self-guided


# Customize your Azure Portal

  1. Launch [Azure Portal](https://portal.azure.com/).
  2. On left most panel, scroll to bottom, then click **More Services**.
  3. Find and Pin, **Virtual networks**.
  4. Find and Pin, **Availability sets**.
  5. Find and Pin, **Load balancers**.
  6. Find and Pin, **Network security groups**.

  ![Screenshot](media/website-on-iaas-http/poc-1.png)


# Resource Group creation

  > Note: For all **(prefix)** references, use a globally unique name to be used throughout this walkthrough.

  1. Create a Resource Group named **(prefix)-poc-rg**.

  ![Screenshot](media/website-on-iaas-http/poc-2.png)


# Virtual Network Creation

  1. Create a VNET named **(prefix)-usw2-vnet**.
  2. Create a Subnet named **(prefix)-web-snet**.

  ![Screenshot](media/website-on-iaas-http/poc-3.png)

  3. Create a Subnet named **(prefix)-app-snet**.

  ![Screenshot](media/website-on-iaas-http/poc-4.png)


# Virtual Machine Creation

  1. Create 2 VMs with the following settings:
    * Image from the marketplace: **Windows Server 2016 Datacenter**
    * Names: **(prefix)-web01-vm** and **(prefix)-web02-vm**
    * VM disk type: **HDD disk**

  ![Screenshot](media/website-on-iaas-http/poc-5.png)

    * Size: **D1_V2**
    * Availability Set: **(prefix)-web-as** (create it during the creation of the first VM)
    * Storage / use managed disks: **Yes**
    * Virtual Network: select the previously create Virtual Network 
    * Subnet: select the previsouly created web subnet

  ![Screenshot](media/website-on-iaas-http/poc-vm-settings-1.png)

    * Create a Diagnostics Storage account named **(prefix)webdiag**.

  ![Screenshot](media/website-on-iaas-http/poc-7.png)


# Install IIs on the VMs

   1. From the Virtual Machine blade, select the 1st VM, click **Connect** and login to machine.

      ![Screenshot](media/website-on-iaas-http/poc-9.png)

   2. Once logged into the RDP session choose one option below to install the Web Server role (PowerShell or GUI):

      * **PowerShell**

         * Open the **Windows PowerShell ISE** from the windows start menu as **Administrator**

            ![Screenshot](media/website-on-iaas-http/poc-windows-powershell-ise.png)

         * Run the following PowerShell script from the **ISE**

            ```
            Set-ExecutionPolicy Bypass -Scope Process;
            Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole;
            Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer;
            ```

      * **GUI**

         * From the **Server Manager Dashboard**, select **Add Roles and Features**

            ![Screenshot](media/website-on-iaas-http/poc-10.png)

        * Click **Next** on **Before you Begin**
        * Click **Next** on **Installation Type**
        * Click **Next** on **Server Selection**
        * On **Server Roles**, select **Web Server IIS**
        * On **Add Roles and Features** popup, click **Add Features**
        * On **Server Roles**, click **Next**
        * On **Features**, click **Next**
        * On **Web Server Role(IIS)**, click **Next**
        * On **Role Services**, click **Next**
        * On  **Confirmation**, click **Install**

          ![Screenshot](media/website-on-iaas-http/poc-11.png)

        * On  **Confirmation**, click **Close**

     > Note: Wait for the Web Server role installation to complete (PowerShell or GUI).

   3. Launch the **Internet Information Services (IIS) Manager** from the **Server Manager** tools menu.
   4. In the **Connections** panel, drill down to **Sites**.
   5. On **Default Web Site**, **Right-Click** and select **Switch to Content View**.
   6. **Right-Click** anywhere in panel and select **Explore**.
   7. From the **Windows Explorer**, **Right-Click** on the file **IISStart.html**, and open in **Notepad**.

     ![Screenshot](media/website-on-iaas-http/poc-12.png)

   8. Find the follow line right after the <**body**> tag and add the following.

      ```
      For VM1: <h1>This is Web Server 01</h1>
      For VM2: <h1>This is Web Server 02</h1>
      ``` 

     ![Screenshot](media/website-on-iaas-http/poc-13.png)

   9. From Virtual Machine blade, select the 2nd VM, click **Connect** and login to machine and repeat all the steps above.

     ![Screenshot](media/website-on-iaas-http/poc-14.png)


# Load Balancer Creation

  1. From the left panel on the Azure Portal, select **Load balancers**.
  2. Click on **Add**.
  3. Name: **(prefix)-web-lb**.
  4. Click **Public IP Address**, click **New**.
  5. Enter name **(prefix)-web-pip**, click **Ok**.

  ![Screenshot](media/website-on-iaas-http/poc-15-dynamic.png)

  6. Select **Use Existing** for **Resource Group**, i.e. **(prefix)-poc-rg**, click **Create**.

  ![Screenshot](media/website-on-iaas-http/poc-16.png)

  7. After the **Load Balancer** is created, select the one you added.

  ![Screenshot](media/website-on-iaas-http/poc-17.png)

  8. Under **Settings** select **Health probes**, click **Add**.
  9. Enter name **(prefix)-web-prob**, leaving all the defaults, click **Ok**.

  ![Screenshot](media/website-on-iaas-http/poc-18.png)


# Add the VMs to Load Balancer

  1. Under **Settings** select **Backend pools**, click **Add**.
  2. Enter name **(prefix)-web-pool**.
  3. For **Associated to**, select **Availability set**.
  4. For the **Availability set**, select **(prefix)-web-as**.
  5. Click **Add a target network IP configuration** to add the first web server and its IP address.

  ![Screenshot](media/website-on-iaas-http/poc-19.png)

  6. **Repeat** the step above to also add the IP configuration for the second web server.
  7. Click **OK**.


# Create the load balancing rule for HTTP

   1. Under **Settings** select **Load balancing rules**, click **Add**.
      * Enter name **(prefix)-http-lbr**
      * Protocol: **TCP**
      * Port: **80**
      * Backend port: 80
      * Backend pool: **(prefix)-web-pool(2VMs)**
      * Probe: **(prefix)-web-prob(HTTP:80)**
      * Session Persistence: **None**
      * Idle timeout (min):**4**
      * Floating IP (direct server return): **Disabled**
      * Click **Ok**

      ![Screenshot](media/website-on-iaas-http/poc-22.png)


# Update the NSG (inbound security rule)

## Virtual machine #1 and #2

   1. From the left panel on the Azure Portal, select **Virtual machines**, then select **(prefix)-web01-vm**.
   2. Under **Settings** select **Network Interfaces**.
   3. Click on **(prefix)-web01-vm-nsg**.
   4. Under **Settings** select **Network Security Groups**.
   5. Under **Network Security Group**, click on **(prefix)-web01-vm-nsg**.

   ![Screenshot](media/website-on-iaas-http/poc-23.png)

   6. Under **Settings**, click on **Inbound Security Rules**.
   7. Click **Add** 
      * Enter name **(prefix)-web01-vm-nsgr-http-allow**
      * Priority:**1010**
      * Source: **any**
      * Service: **HTTP**
      * Protocol: **TCP**
      * Port range: **80**
      * Action: **Allow**

   ![Screenshot](media/website-on-iaas-http/poc-24.png)

   8. Repeat the steps for the VIrtual Machine **(prefix)-web02-vm**.

   ![Screenshot](media/website-on-iaas-http/poc-25.png)

   ![Screenshot](media/website-on-iaas-http/poc-26.png)


# Assign DNS name to Load Balancer

   1. From the left panel on the Azure Portal, select **Public IP addresses**.
   2. Select **(prefix)-web-pip**.
   3. Under Settings, click on **Configuration**.
   4. Under DNS name enter **(prefix)** (i.e. http://**(prefix)**.westus2.cloudapp.azure.com/).

   ![Screenshot](media/website-on-iaas-http/poc-27.png)


# Testing 

   1. Browse to the load balancer public IP or **http://(prefix).westus2.cloudapp.azure.com/**.
   2. You will see the IIS server default page showing either Web Server 01 or 02.
   3. If you see Web Server 01, then RDP into VM1, stop the Default Web Site in IIS. Refresh the web page, you will see Web Server 02. The Load balancer detects VM1 is down and redirects traffic to VM2.

   ![Screenshot](media/website-on-iaas-http/poc-28.png)


# Automation Scripts (ARM Template)

   1. From the left panel on the Azure Portal, select **Resource Groups**.
   2. Select **(prefix)-poc-rg**.
   3. Under Settings, click **Download** | **Save As** | (select location).

   ![Screenshot](media/website-on-iaas-http/poc-29.png)

   4. After download, **Extract All** to (select location).

   ![Screenshot](media/website-on-iaas-http/poc-30.png)


# Visualize your Architecture with ArmViz
 
   1. Open browser and goto **http://armviz.io** to view the template.

   ![Screenshot](media/website-on-iaas-http/armvizdiagram.png)

