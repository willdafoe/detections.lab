data "azurerm_resources" "existing" {
  count               = local.use_existing ? 0 : 1 # Changing to false to prevent data source from running
  name                = local.existing_resource.name
  resource_group_name = local.existing_resource.resource_group_name
}