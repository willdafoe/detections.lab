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

resource "azurerm_resource_group" "this" {
  count    = var.resource_group_name == null && local.e ? 1 : 0
  name     = format("%s-%02d", data.azurerm_resources.rg == [] ? module.label["resource_group"].id : data.azurerm_resources.rg[0].name, count.index + 1)
  location = var.location
  tags     = module.label["resource_group"].tags
}

resource "azurerm_virtual_network" "this" {
  count               = (local.e && var.vnet_name == null) ? 1 : 0
  name                = format("%s-%02d", data.azurerm_resources.vnet == [] ? module.label["vnet"].id : data.azurerm_resources.rg[0].name, count.index + 1)
  resource_group_name = azurerm_resource_group.this[count.index].name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  dynamic "subnet" {
    for_each = local.number_of_subnets ? [1] : [0]
    content {
      name           = format("%s-%02d", module.label["subnet"].id, count.index)
      address_prefix = local.ipv4_subnet_cidrs
      security_group = var.nsg_name
    }
  }
  tags = module.label["vnet"].tags
}
