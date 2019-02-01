# When is Hub and Spoke the right model?

The Hub and Spoke model relies on VNET peering as a way to offer connectivity to (typically) multiple "spokes" and one central "hub". Typically this design has its root in the subscription design where different teams might get a dedicated subscription for them to manage resources in.

You can find more information about this design in the [Architecture Center](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke)

This model has some advantages:

* An obvious limitation of having a single Vnet is that that Vnet would be in a single subscription and region. In other words, the Hub & Spoke model can be better for multi-subscription or multi-region deployments
* VNET peering is non transitive: this means spokes cannot communicate with each other: which can be seen as a way to isolate spokes from each other. In a single VNET model you’d be isolating workloads from each other through the use of NSGs or NVA’s (network virtual appliance).
* VNET peering allows VNETs in different subscription to be connected, for example to a central hub, allowing the different components to communicate with each other as well as share certain services like domain controllers or appliances without having to run them in each spoke.
* The Hub and spoke model allows to overcome some of the [limits from  a single VNET](https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits#networking-limits-1)
* From a security perspective, when two vnets are peered they become one. That means that you still need to separate subnets from each other using NSGs. One slight advantage of the hub&spoke model is that in case you want to completely isolate one spoke from the hub (maybe because the spoke got compromised), tearing down the peering will stop all traffic. In a single-vnet scenario you would achieve traffic isolation through NSGs too, but those would not affect traffic flows that were established prior to the NSG reconfiguration. 

But also disadvantages:

* VNET peering is non transitive: this makes routing a lot more complex. If Spoke to Spoke communication is required, it has to go over the NVA no matter what. This involves the creation and management of various User Defined Routes (UDRs).  In a single VNET scenario you could have certain parts of the workload communicate directly (e.g. only using NSG, for example application to data layer) and other workloads communicate over the NVA (for example prod to dev). 
* VNET peering locks the address space: this means the VNET address space cannot be modified as long as the VNET peering relationship is in place.
* VNET peering comes with a, albeit small, [bandwidth cost](https://azure.microsoft.com/en-us/pricing/details/virtual-network/)
* The increased amount of VNETs, Subnets, routes, … will increase the overall complexity to manage the environment. Changes to the environment might be more prone to error.
* As part of that operational complexity, in Azure moving Virtual Machines from one Vnet to another is not possible. Hence you cannot move VMs across spokes
* Azure Load Balancer can only distribute traffic to virtual machines in the same Virtual Network, so you will not be able to distribute traffic across VMs that are in multiple spokes. Note that the Azure Application Gateway does not have the same limitation as the Azure Load Balancer

