data "azurerm_resources" "rg" {
  count = (local.e && var.resource_group_name != null) ? 1 : 0
  #name = var.resource_group_name
  type = "Microsoft.Resources/resourceGroups"
  timeouts {
    read = "5m"
  }
}

data "azurerm_resources" "vnet" {
  count = (local.e && var.vnet_name != null) ? 1 : 0
  type  = "Microsoft.Network/virtualNetworks"
  timeouts {
    read = "5m"
  }
}

data "azurerm_virtual_network" "default" {
  count               = local.e && length(data.azurerm_resources.rg) > 0 && length(data.azurerm_resources.vnet) > 0 ? 1 : 0
  name                = data.azurerm_resources.vnet[count.index].name == [] ? var.vnet_name : null
  resource_group_name = data.azurerm_resources.rg[count.index].name == [] ? var.resource_group_name : null
}