resource "azurerm_resource_group" "rgroup" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "bhargav.kavade"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
    HumberID       = "1065"
  }
}
