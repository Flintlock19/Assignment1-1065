variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be provisioned"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_address_space" {
  description = "Address space for the subnet"
  type        = list(string)
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
}

variable "nsg_inbound_ports" {
  description = "List of inbound ports allowed by NSG"
  type        = list(number)
}


