# Network Interface
resource "azurerm_network_interface" "linux_nic" {
  for_each            = var.linux_vms
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_public_ip[each.key].id
  }

  tags = local.tags
}

# Availability Set
resource "azurerm_availability_set" "linux_availability_set" {
  name                = "${var.humberid}-linux-as"  # Update with your desired name format
  location            = var.location
  resource_group_name = var.resource_group_name
  managed             = true

  tags = local.tags
}

# Public IP Address
resource "azurerm_public_ip" "linux_public_ip" {
  for_each            = var.linux_vms
  name                = "${each.key}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = each.value.domain_label

  tags = local.tags
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each             = var.linux_vms
  name                 = each.key
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  availability_set_id  = azurerm_availability_set.linux_availability_set.id
  size                 = var.vm_size

  admin_username       = var.admin_username

  os_disk {
    name              = "${each.value.name}-os-disk"
    caching           = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb      = var.os_disk_size
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  disable_password_authentication = true

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_uri
  }

  tags = local.tags
}

# Azure Monitor Extension
resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each            = azurerm_linux_virtual_machine.linux_vm
  name                = "AzureMonitorLinuxAgent"
  virtual_machine_id  = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher           = "Microsoft.Azure.Monitor"
  type                = "AzureMonitorLinuxAgent"
  type_handler_version = "1.2"
  auto_upgrade_minor_version = true

  tags = local.tags
}

# Network Watcher Extension
resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each             = azurerm_linux_virtual_machine.linux_vm
  name                 = "NetworkWatcherAgentLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"

  tags = local.tags
}
