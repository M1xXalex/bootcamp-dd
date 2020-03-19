output "id" {
  description = "The storage account ID."
  value       = azurerm_storage_account.st.id
}

output "name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.st.name
}

output "primary_connection_string" {
  description = "The primrary connection string to the storage."
  value       = azurerm_storage_account.st.primary_connection_string
}

output "secondary_connection_string" {
  description = "The secondary connection string to the storage."
  value       = azurerm_storage_account.st.secondary_connection_string
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.st.primary_access_key
}

output "secondary_access_key" {
  description = "The secondary access key for the storage account."
  value       = azurerm_storage_account.st.secondary_access_key
}

output "primary_web_endpoint" {
  description = "The endpoint URL for web storage in the primary location."
  value       = azurerm_storage_account.st.primary_web_endpoint
}

output "secondary_web_endpoint" {
  description = "The secondary access key for the storage account."
  value       = azurerm_storage_account.st.secondary_web_endpoint
}

output "primary_web_host" {
  description = "The hostname with port if applicable for web storage in the primary location."
  value       = azurerm_storage_account.st.primary_web_host
}

output "secondary_web_host" {
  description = "The hostname with port if applicable for web storage in the secondary location."
  value       = azurerm_storage_account.st.primary_web_host
}
