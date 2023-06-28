locals {
  enabled      = module.this.enabled
  use_existing = (var.resource_group_name != null || var.vnet_name != null) ? true : false
  e            = local.enabled && local.use_existing

  labels = [for key in keys(var.labels) : merge(
    {
      key   = key
      value = var.labels[key]
    }
  )]

  existing_resource = {
    name = try(var.resource_group_name, var.vnet_name, null)
    type = try(var.resource_group_name != null ? "Microsoft.Resources/resourceGroups" : null, var.vnet_name != null ? "Microsoft.Network/virtualNetworks" : null, null)
    required_tags = try(merge(
      var.filter_tags,
      local.labels[0],
      var.tags
    ), null)
  }
}