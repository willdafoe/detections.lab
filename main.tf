module "label" {
  source          = "github.com/willdafoe/terraform-context-label.git"
  for_each        = var.labels
  enabled         = module.this.enabled
  name            = var.name
  namespace       = var.namespace
  environment     = var.environment
  location        = var.location
  stage           = var.stage
  delimiter       = var.delimiter
  attributes      = each.value.attributes
  tags            = var.tags
  label_order     = var.label_order
  id_length_limit = each.value.id_length_limit
  context         = module.this.context
}

resource "terraform_data" "this" {
  count = local.use_existing ? 1 : 0
  input = data.azurerm_resources.existing[count.index]
}

resource "azurerm_resource_group" "this" {
  count    = module.this.enabled ? 1 : 0
  name     = format("%s-%02d", module.label["resource_group"].id, count.index + 1)
  location = var.location
  tags     = module.label["resource_group"].tags
}

#resource "terraform_data" "default" {
#  count = local.use_existing ? 1 : 0
#  input = {
#    name                = data.azurerm_resources.existing[count.index].resources == [] ? data.azurerm_resources.existing[count.index].name : null
#    resource_group_name = !(data.azurerm_resources.existing[count.index].resources == []) ? data.azurerm_resources.existing[count.index].resources[count.index].resource_group_name : azurerm_resource_group.this[count.index].name
#  }
#}

#resource "azurerm_virtual_network" "this" {
#  count               = !(local.use_existing) && var.vnet_name == null ? 1 : 0
#  name                = format("%s-%02d", module.label["vnet"].id, count.index + 1)
#  resource_group_name = terraform_data.default[count.index].resource_group_name
#  location            = var.location
#  address_space       = var.address_space
#  dns_servers         = var.dns_servers
#dynamic "subnet" {
#  for_each = local.e ? [local.number_of_subnets] : [0]
#  content {
#    name           = format("%s-%02d", module.label["subnet"].id, count.index)
#    address_prefix = [element(local.ipv4_subnet_cidrs, count.index)]
#    security_group = var.nsg_name
#  }
#}  
# tags = module.label["vnet"].tags
#}
