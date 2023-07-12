data "azurerm_resources" "existing" {
  count = local.use_existing ? 1 : 0
  name  = local.existing_resource.name
}

data "azurerm_resources" "default" {
  count               = (module.this.enabled && !(var.resource_group_name == null) && !(var.vnet_name == null)) ? 1 : 0
  name                = azurerm_resource_group.this[count.index].name == null ? azurerm_virtual_network.this[count.index].name : null
  resource_group_name = !(azurerm_resource_group.this[count.index].name == null) ? azurerm_resource_group.this[count.index].name : null
}
