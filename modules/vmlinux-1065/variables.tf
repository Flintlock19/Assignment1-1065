# Define local variables
locals {
  tags = {
    Assignment    = "CCGC 5502 Automation Assignment"
    Name          = "bhargav.kavade"
    ExpirationDate = "2024-12-31"
    Environment   = "Learning"
  }
}
variable "humberid" {
  description = "Humber ID"
  type        = string
}

variable "linux_vms" {
  description = "Map of Linux VMs to be created"
  type        = map(object({
    name         = string
    domain_label = string
  }))
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "public_key" {
  description = "The public SSH key for the virtual machine"
  type        = string
}

variable "private_key" {
  description = "The private SSH key for the virtual machine"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
}

variable "os_disk_size" {
  description = "The size of the OS disk in GB"
  type        = number
}

variable "os_disk_caching" {
  description = "The caching mode for the OS disk"
  type        = string
}

variable "boot_diagnostics_storage_uri" {
  description = "The URI of the storage account for boot diagnostics"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  type        = string
}
