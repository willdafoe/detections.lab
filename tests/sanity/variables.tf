variable "module" {
  type = map(object({
    enabled             = optional(bool)
    name                = optional(string)
    namespace           = optional(string)
    environment         = optional(string)
    location            = optional(string)
    stage               = optional(string)
    delimiter           = optional(string)
    attributes          = optional(list(string))
    tags                = optional(map(string))
    label_order         = optional(list(string))
    id_length_limit     = optional(number)
    address_space       = optional(list(string))
    address_prefixes    = optional(list(string))
    nsg_name            = optional(string)
    max_subnet_count    = optional(number)
    subnet_count        = optional(number)
    dns_servers         = optional(list(string))
    resource_group_name = optional(string)
    vnet_name           = optional(string)
  }))
  default = {}
}