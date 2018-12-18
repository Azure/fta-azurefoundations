# When is Hub and Spoke the right model?

The Hub and Spoke model relies on VNET peering as a way to offer connectivity to (typically) multiple “spokes” and one central “hub”. Typically this design has its root in the subscription design where different teams might get a dedicated subscription for them to manage resources in.

You can find more information about this design in the [Architecture Center](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke)

This model has some advantages:

* VNET peering is non transitive: this means spokes cannot communicate with each other: which can be seen as a way to isolate spokes from each other. In a single VNET model you’d be isolating workloads from each other through the use of NSGs or NVA’s (network virtual appliance).
* VNET peering allows VNETs in different subscription to be connected, for example to a central hub, allowing the different components to communicate with each other as well as share certain services like domain controllers or appliances without having to run them in each spoke.
* The Hub and spoke model allows to overcome some of the [limits from  a single VNET](https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits#networking-limits-1 )

But also disadvantages:
* VNET peering is non transitive: this makes routing a lot more complex. If Spoke to Spoke communication is required, it has to go over the NVA no matter what. This involves the creation and management of various User Defined Routes (UDRs).  In a single VNET scenario you could have certain parts of the workload communicate directly (e.g. only using NSG, for example application to data layer) and other workloads communicate over the NVA (for example prod to dev). 
* VNET peering locks the address space: this means the VNET address space cannot be modified as long as the VNET peering relationship is in place.
* VNET peering comes with a, albeit small, [bandwidth cost](https://azure.microsoft.com/en-us/pricing/details/virtual-network/)
* The increased amount of VNETs, Subnets, routes, … will increase the overall complexity to manage the environment. Changes to the environment might be more prone to error.

