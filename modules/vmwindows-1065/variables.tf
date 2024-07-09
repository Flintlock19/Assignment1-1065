variable "humber_id" {
  description = "Humber ID for unique resource naming"
  type        = string
}

variable "location" {
  description = "Azure region location"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where resources will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where VM will be deployed"
  type        = string
}

variable "storage_account_uri" {
  description = "URI of the storage account for boot diagnostics"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}

variable "windows_vm_count" {
  description = "Number of Windows VMs to deploy"
  type        = number
}

variable "windows_vm_size" {
  description = "Size of the Windows VM"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace for monitoring"
  type        = string
}
