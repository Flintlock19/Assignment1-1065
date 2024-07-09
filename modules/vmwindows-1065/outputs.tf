output "windows_vm_hostnames" {
  description = "Hostnames of the Windows VMs"
  value       = azurerm_windows_virtual_machine.virtual_machine[*].name
}

output "windows_vm_fqdns" {
  description = "FQDNs of the Windows VMs"
  value       = azurerm_public_ip.public_ip[*].fqdn
}

output "windows_vm_private_ips" {
  description = "Private IP addresses of the Windows VMs"
  value       = azurerm_network_interface.nic[*].private_ip_address
}

output "windows_vm_public_ips" {
  description = "Public IP addresses of the Windows VMs"
  value       = azurerm_public_ip.public_ip[*].ip_address
}

output "windows_vm_ids" {
  description = "Resource IDs of the Windows VMs"
  value       = [for vm in azurerm_windows_virtual_machine.virtual_machine : vm.id]
}
