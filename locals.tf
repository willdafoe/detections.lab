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

  #Build local.name value. Previously used `try()` in local.existing_resource.name, however, this returns back first try value. This is not the desired behavior. Instead, we want to return the value of the variable that is not null. This is accomplished by using the `!()` function. This function returns the value of the variable that is not null. If both variables are null, then the function returns null.

  existing_resource = {
    name                = !(var.resource_group_name == null) ? var.resource_group_name : !(var.vnet_name == null) ? var.vnet_name : null
    resource_group_name = !(var.resource_group_name == null) ? var.resource_group_name : null
  }
}