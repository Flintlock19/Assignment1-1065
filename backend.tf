terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01651065RG"
    storage_account_name = "tfstaten01651065sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}
