variable "nsg_name" {
  description = <<EOD
    [Optional] The name of an existing network security group. If this value is not provided, the module will attempt to verify that the network security group exists before attempting to create it.
    EOD
  type        = string
  default     = null
}

variable "address_space" {
  description = <<EOD
    [Optional] IP address space in CIDR notation if a virtual network will be created.
    EOD
  type        = list(string)
  default     = []
}

variable "address_prefixes" {
  description = <<EOD
    Lists of CIDRs to assign to subnets. Order of CIDRs in the lists must not change over time.
    Lists may contain more CIDRs than needed.
  EOD
  default     = []
  validation {
    condition     = length(var.address_prefixes) < 2
    error_message = "Only 1 address_prefixes object can be provided. Lists of CIDRs are passed via the `public` and `private` attributes of the single object."
  }
}

variable "max_subnet_count" {
  description = <<EOD
  The maximum number of subnets to create.
  EOD
  type        = number
  default     = 0
}

variable "subnet_count" {
  description = <<EOD
  The number of subnets to create
  EOD
  type        = number
  default     = 1
  validation {
    condition     = length([var.subnet_count]) > 0
    error_message = <<EOM
    Error: Number of subnets to create must by greater than 0
    EOM
  }
}

variable "dns_servers" {
  description = <<EOD
    [Optional] DNS servers in CIDR notation if a virtual network will be created.
    EOD
  type        = list(string)
  default     = []
}
variable "resource_group_name" {
  description = <<EOD
    [Optional] The name of an existing resource group. If this value is not provided, the module will attempt to verify that the resource group exists before attempting to create it.
    EOD
  type        = string
  default     = null
}

variable "vnet_name" {
  description = <<EOD
    [Optional] The name of an existing virtual network. If this value is not provided, the module will attempt to verify that the virtual network exists before attempting to create it.
    EOD
  type        = string
  default     = null
}

variable "labels" {
  description = <<EOD
    [Not User Defined] Map of object containing label definitions for different resources.
    EOD
  type = map(object({
    attributes      = optional(list(string))
    id_length_limit = optional(number)
  }))
  default = {
    resource_group = {
      attributes      = ["resource group"]
      id_length_limit = 80
    }
    vnet = {
      attributes      = ["virtual network"]
      id_length_limit = 64
    }
    subnet = {
      attributes      = ["subnet"]
      id_length_limit = 80
    }
    nsg = {
      attributes = ["network security group"]
    }
    storage_account = {
      attributes      = ["storage account"]
      id_length_limit = 24
    }
    public_ip = {
      attributes      = ["public ip"]
      id_length_limit = 64
    }
    nic = {
      attributes      = ["network interface"]
      id_length_limit = 80
    }
    win_vm = {
      attributes      = ["windows virtual machine"]
      id_length_limit = 15
    }
    linux_vm = {
      attributes      = ["linux virtual machine"]
      id_length_limit = 64
    }
  }
}