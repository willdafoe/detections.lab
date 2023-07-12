data "azurerm_resources" "existing" {
  count               = local.use_existing ? 1 : 0
  name                = local.existing_resource.name
  resource_group_name = local.existing_resource.resource_group_name
}