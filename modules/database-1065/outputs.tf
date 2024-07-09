output "postgresql_server_name" {
  description = "Name of the PostgreSQL server instance"
  value       = azurerm_postgresql_server.db.name
}

output "postgresql_database_name" {
  description = "Name of the PostgreSQL database"
  value       = azurerm_postgresql_database.db.name
}
