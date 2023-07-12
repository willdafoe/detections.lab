#output "use_existing_resource" {
#   value = local.use_existing
#}

output "resource_group_name" {
  value = (
    length([join("", azurerm_resource_group.this[*].name)]) > 0 ? join("", azurerm_resource_group.this[*].name) :
    (length(data.azurerm_resources.existing[0].resources) > 0 ?
    data.azurerm_resources.existing[0].name : data.azurerm_resources.existing[0].resources[0].resource_group_name)
  )
}

#output "data_source_keys" {
#  value = flatten([ for key,type in data.azurerm_resources.existing[0].resources : [
#    for index in range(length(data.azurerm_resources.existing[0].resources)) : {
#      type =type.type
#    }
#  ]])
#}

#output "terraform_data" {
#  value = terraform_data.default
#}