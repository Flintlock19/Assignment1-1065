module "rgroup_1065" {
  source              = "./modules/rgroup-1065"
  location            = "East US"
  resource_group_name = "1065-RG"
}

module "network_1065" {
  source                       = "./modules/network-1065"
  resource_group_name          = module.rgroup_1065.resource_group_name
  location                     = "East US"
  virtual_network_name         = "1065-VNET"
  virtual_network_address_space = ["10.0.0.0/16"]
  subnet_name                  = "1065-SUBNET"
  subnet_address_space         = ["10.0.0.0/24"]
  network_security_group_name  = "1065-NSG"
  nsg_inbound_ports            = [22, 3389, 5985, 80]
}
module "common_1065" {
  source              = "./modules/common-1065"
  location                     = "East US"
  resource_group_name = module.rgroup_1065.resource_group_name
}

module "vmlinux_1065" {
  source                     = "./modules/vmlinux-1065"
  humberid                   = "1065"
  linux_vms                  = {
    "1065-linux-vm1" = {
      name         = "linux-vm1",
      domain_label = "linux-vm1-1065"
    },
    "1065-linux-vm2" = {
      name         = "linux-vm2",
      domain_label = "linux-vm2-1065"
    },
    "1065-linux-vm3" = {
      name         = "linux-vm3",
      domain_label = "linux-vm3-1065"
    }
  }
  resource_group_name        = module.rgroup_1065.resource_group_name
  location                   = "East US"
  vm_size                    = "Standard_B1ms"
  admin_username             = "adminuser"
  public_key                 = "/home/N01651065/.ssh/id_rsa.pub"
  private_key                = "/home/N01651065/.ssh/id_rsa"
  os_disk_storage_account_type = "Standard_LRS"
  os_disk_size               = 32
  os_disk_caching            = "ReadWrite"
  boot_diagnostics_storage_uri = "https://${module.common_1065.storage_account_name}.blob.core.windows.net/"
  subnet_id                  = module.network_1065.subnet_id
  log_analytics_workspace_id = module.common_1065.log_analytics_workspace_name
}
 

module "vmwindows_1065" {
  source                       = "./modules/vmwindows-1065"
  humber_id                    = "1065"
  resource_group_name          = module.rgroup_1065.resource_group_name
  location                     = "East US"
  subnet_id                    = module.network_1065.subnet_id
  storage_account_uri          = "https://${module.common_1065.storage_account_name}.blob.core.windows.net/"
  admin_username               = "adminuser"
  admin_password               = "Password123"  # Replace with actual password or use a secret management tool
  windows_vm_count             = 1
  windows_vm_size              = "Standard_B1ms"
  tags                         = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name       = "bhargav.kavade"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
  log_analytics_workspace_id   = module.common_1065.log_analytics_workspace_name
}

module "datadisk_1065" {
  source              = "./modules/datadisk-1065"
  humber_id           = "1065"
  location            = "East US"
  resource_group_name = module.rgroup_1065.resource_group_name
  linux_vm_ids        = module.vmlinux_1065.vm_ids
  windows_vm_ids      = [module.vmwindows_1065.windows_vm_ids[0]]  # Assuming only one Windows VM is deployed
}

module "loadbalancer_1065" {
  source               = "./modules/loadbalancer-1065"
  humber_id            = "1065"
  location             = "East US"
  resource_group_name  = module.rgroup_1065.resource_group_name
  linux_vm_nic_ids     = module.vmlinux_1065.network_interface_ids
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "bhargav.kavade"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


module "database_1065" {
  source              = "./modules/database-1065"
  location            = "East US"
  resource_group_name = module.rgroup_1065.resource_group_name
  humber_id           = "1065"
  admin_username      = "myadmin"
  admin_password      = "P@ssw0rd!"
  postgresql_version  = "11"
  ssl_enforcement_enabled = true
}
