output "vm_ids" {
  description = "IDs of the Linux VMs"
  value       = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.id]
}

output "vm_hostnames" {
  description = "Hostnames of the Linux VMs"
  value       = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.name]
}

output "vm_fqdns" {
  description = "FQDNs of the Linux VMs"
  value       = [for ip in azurerm_public_ip.linux_public_ip : ip.fqdn]
}

output "private_ip_addresses" {
  description = "Private IP addresses of the Linux VMs"
  value       = [for nic in azurerm_network_interface.linux_nic : nic.private_ip_address]
}

output "public_ip_addresses" {
  description = "Public IP addresses of the Linux VMs"
  value       = [for ip in azurerm_public_ip.linux_public_ip : ip.ip_address]
}

output "network_interface_ids" {
  description = "IDs of the network interfaces of the Linux VMs"
  value       = [for nic in azurerm_network_interface.linux_nic : nic.id]
}
