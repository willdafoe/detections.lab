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