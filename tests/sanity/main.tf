provider "azurerm" {
  features {}
}


module "test" {
  source        = "../../"
  for_each      = var.module
  name          = each.value.name
  namespace     = each.value.namespace
  environment   = each.value.environment
  location      = each.value.location
  stage         = each.value.stage
  address_space = each.value.address_space
}