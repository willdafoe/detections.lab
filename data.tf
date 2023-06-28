data "azurerm_resources" "existing" {
  count         = local.e ? 1 : 0
  name          = local.existing_resource.name
  type          = local.existing_resource.type
  required_tags = local.existing_resource.required_tags
  timeouts {
    read = "5m"
  }
}