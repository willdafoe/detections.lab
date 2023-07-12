output "use_existing_resource" {
  value = local.use_existing
}

output "resource_group_name" {
  value = join("", azurerm_resource_group.this[*].name)
}

output "virtual_network_name" {
  value = join("", azurerm_virtual_network.this[*].name)
}

output "terraform_data" {
  value = terraform_data.existing
}