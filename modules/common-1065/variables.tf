
variable "location" {
  description = "Azure location for the common resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "bhargav.kavade"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
