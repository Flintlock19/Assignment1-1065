output "rgroup_1065_resource_group_name" {
  description = "The name of the resource group provisioned by the rgroup-1065 module"
  value       = module.rgroup_1065.resource_group_name
}
output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = module.network_1065.virtual_network_name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = module.network_1065.subnet_name
}

output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace"
  value       = module.common_1065.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  description = "The name of the Recovery Services Vault"
  value       = module.common_1065.recovery_services_vault_name
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = module.common_1065.storage_account_name
}

output "linux_vm_hostnames" {
  description = "The hostnames of the Linux VMs"
  value       = module.vmlinux_1065.vm_hostnames
}

output "linux_vm_fqdns" {
  description = "The FQDNs of the Linux VMs"
  value       = module.vmlinux_1065.vm_fqdns
}

output "linux_private_ip_addresses" {
  description = "The private IP addresses of the Linux VMs"
  value       = module.vmlinux_1065.private_ip_addresses
}

output "linux_public_ip_addresses" {
  description = "The public IP addresses of the Linux VMs"
  value       = module.vmlinux_1065.public_ip_addresses
}

output "linux_vm_ids" {
  description = "IDs of the Linux VMs"
  value       = module.vmlinux_1065.vm_ids
}

output "windows_vm_hostnames" {
  value = module.vmwindows_1065.windows_vm_hostnames
}

output "windows_vm_fqdns" {
  value = module.vmwindows_1065.windows_vm_fqdns
}

output "windows_vm_private_ips" {
  value = module.vmwindows_1065.windows_vm_private_ips
}

output "windows_vm_public_ips" {
  value = module.vmwindows_1065.windows_vm_public_ips
}

output "windows_vm_ids" {
  value = module.vmwindows_1065.windows_vm_ids
}

output "data_disk_ids" {
  description = "IDs of the provisioned data disks"
  value       = module.datadisk_1065.data_disk_ids
}
output "load_balancer_name" {
  description = "The name of the load balancer"
  value       = module.loadbalancer_1065.load_balancer_name
}
output "database_instance_name" {
  description = "Name of the PostgreSQL server instance"
  value       = module.database_1065.postgresql_server_name
}

output "database_name" {
  description = "Name of the PostgreSQL database"
  value       = module.database_1065.postgresql_database_name
}
