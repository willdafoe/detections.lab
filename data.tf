data "azurerm_virtual_network" "default" {
  count = module.this.enabled && !(var.vnet_name == null) && !(var.resource_group_name == null) ? 1 : 0
}