locals {
  # Evaluate bool value to optionally use an existing resource, 
  # whether one of resource_group or virtual_network.
  use_existing = module.this.enabled && (!(var.resource_group_name == null) || !(var.vnet_name == null)) ? true : false

  # Label module default value mappings
  labels = [for key in keys(var.labels) : merge(
    {
      key   = key
      value = var.labels[key]
    }
  )]

  # Local value attempts to build/evaluate either a resource name or a resource_group name. Based on which of the two is not null. Additionally, a mapping to a resource type is built specifically for the purpose of filtering the returned data from the data sources to limit the scope of the returned data.
  existing_resource = {
    name                = try(var.resource_group_name, var.vnet_name, null)
    resource_group_name = !(var.resource_group_name == null) ? var.resource_group_name : null
    type                = try(var.resource_group_name != null ? "Microsoft.Resources/resourceGroups" : null, var.vnet_name != null ? "Microsoft.Network/virtualNetworks" : null, null)
    required_tags       = try(var.filter_tags, null)
  }
}