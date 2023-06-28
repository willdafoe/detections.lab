# sanity

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_detection_lab"></a> [detection\_lab](#module\_detection\_lab) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_module"></a> [module](#input\_module) | n/a | <pre>map(object({<br>    enabled             = optional(bool)<br>    name                = optional(string)<br>    namespace           = optional(string)<br>    environment         = optional(string)<br>    location            = optional(string)<br>    stage               = optional(string)<br>    delimiter           = optional(string)<br>    attributes          = optional(list(string))<br>    tags                = optional(map(string))<br>    label_order         = optional(list(string))<br>    id_length_limit     = optional(number)<br>    address_space       = optional(list(string))<br>    address_prefixes    = optional(list(string))<br>    nsg_name            = optional(string)<br>    max_subnet_count    = optional(number)<br>    subnet_count        = optional(number)<br>    dns_servers         = optional(list(string))<br>    resource_group_name = optional(string)<br>    vnet_name           = optional(string)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module"></a> [module](#output\_module) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
