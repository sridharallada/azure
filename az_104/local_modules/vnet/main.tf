###############################################################################################
# Create Virtual Networks
###############################################################################################
resource "azurerm_virtual_network" "vnet" {
  for_each = {
    for net in local.vnet-list : net.vnet-key => net
  }

    name                = each.key
    address_space       = each.value.address_space
    dns_servers         = each.value.dns_servers
    location            = var.region-name
    tags                = lookup(each.value, "tags", null) == null ? var.global-tags : merge(var.global-tags, each.value.tags)
    resource_group_name = var.network-resource-group
}