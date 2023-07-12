locals {
  use_existing = module.(var.resource_group_name != null || var.vnet_name != null) ? true : false

  labels = [for key in keys(var.labels) : merge(
    {
      key   = key
      value = var.labels[key]
    }
  )]

  existing_resource = {
    name          = try(var.resource_group_name, var.vnet_name, null)
    type          = try(var.resource_group_name != null ? "Microsoft.Resources/resourceGroups" : null, var.vnet_name != null ? "Microsoft.Network/virtualNetworks" : null, null)
    required_tags = try(var.filter_tags, null)
  }
}