#output "resource_group" {
#  value = azurerm_resource_group.this
#}

#output "virtual_network" {
#  value = azurerm_virtual_network.this
#}

#output "azurerm_resources" {
#  value = data.azurerm_resources.existing
#}
output "azurem_resource" {
  value = data.azurerm_resources.existing
}
