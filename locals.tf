locals {
  enabled = module.this.enabled
  e       = local.enabled

  number_of_subnets         = length([var.max_subnet_count]) > 0 ? var.max_subnet_count : var.subnet_count
  subnet_count              = local.e ? local.number_of_subnets : 0
  existing_subnet_count     = local.e ? length(data.azurerm_virtual_network.default[0].subnets) : 0
  base_cidr_reservations    = (var.max_subnet_count == 0 ? var.subnet_count : var.max_subnet_count) * var.subnet_count
  cidr_reservations         = (local.e ? 1 : 0) * local.base_cidr_reservations
  supplied_ipv4_cidrs       = length(var.address_prefixes) > 0 ? var.address_space : []
  compute_ipv4_cidrs        = local.e && (length(local.supplied_ipv4_cidrs)) == 0
  required_ipv4_subnet_bits = local.e ? ceil(log(local.cidr_reservations, 2)) : 1
  need_vnet_data            = (local.compute_ipv4_cidrs && length(var.address_prefixes) == 0)
  base_ipv4_cidr_block      = length(var.address_prefixes) > 0 ? var.address_prefixes[0] : (local.need_vnet_data ? element(data.azurerm_virtual_network.default[0].address_space, 0) : "")
  ipv4_subnet_cidrs = local.compute_ipv4_cidrs ? [
    for net in range(0, local.cidr_reservations) : cidrsubnet(local.base_ipv4_cidr_block, local.required_ipv4_subnet_bits, net)
  ] : local.supplied_ipv4_cidrs
}