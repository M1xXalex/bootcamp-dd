output "name" {
  description = "The name of the storage account."
  value       = module.storage_account_module.name
}

output "primary_web_endpoint" {
  description = "The endpoint URL for web storage in the primary location."
  value       = module.storage_account_module.primary_web_endpoint
}

output "secondary_web_endpoint" {
  description = "The secondary access key for the storage account."
  value       = module.storage_account_module.secondary_web_endpoint
}

output "primary_web_host" {
  description = "The hostname with port if applicable for web storage in the primary location."
  value       = module.storage_account_module.primary_web_host
}

output "secondary_web_host" {
  description = "The hostname with port if applicable for web storage in the secondary location."
  value       = module.storage_account_module.secondary_web_host
}
