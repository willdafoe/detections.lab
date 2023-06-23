output "existing_resource_group" {
  value = data.azurerm_resources.rg
}

output "existing_virtual_network" {
  value = data.azurerm_resources.vnet
}
