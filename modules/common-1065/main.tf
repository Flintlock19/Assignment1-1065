resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "log-analytics-1065"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = "recovery-vault-1065"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = local.common_tags
}

resource "azurerm_storage_account" "storage" {
  name                     = "storage1065"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.common_tags
}
