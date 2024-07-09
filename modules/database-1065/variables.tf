variable "location" {
  description = "Azure region where the PostgreSQL server will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the PostgreSQL server will be deployed"
  type        = string
}

variable "humber_id" {
  description = "Humber ID to use in naming resources"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the PostgreSQL server"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the PostgreSQL server"
  type        = string
}

variable "postgresql_version" {
  description = "Version of PostgreSQL server"
  type        = string
  default     = "12"
}

variable "ssl_enforcement_enabled" {
  description = "Whether SSL enforcement is enabled"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
  default     = {   
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "bhargav.kavade"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
 }
}
