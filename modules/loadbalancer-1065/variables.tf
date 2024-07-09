variable "humber_id" {
  description = "The Humber ID for naming resources"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "linux_vm_nic_ids" {
  description = "List of network interface IDs for Linux VMs"
  type        = list(string)
}
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}
