output "tenant_id" {
  value       = data.azurerm_client_config.current.tenant_id
  description = "The tenant ID where the resources are deployed"
}