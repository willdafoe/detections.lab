provider "azurerm" {
  features {}
}


module "detection_lab" {
  source              = "../../"
  for_each            = var.module
  enabled             = each.value.enabled
  name                = each.value.name
  namespace           = each.value.namespace
  environment         = each.value.environment
  location            = each.value.location
  stage               = each.value.stage
  address_space       = each.value.address_space
  address_prefixes    = each.value.address_prefixes
  nsg_name            = each.value.nsg_name
  subnet_count        = each.value.subnet_count
  dns_servers         = each.value.dns_servers
  resource_group_name = each.value.resource_group_name
  vnet_name           = each.value.vnet_name
}