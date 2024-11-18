output "tenant_id" {
  description = "Azure AD Tenant ID"
  value       = data.azurerm_client_config.current.tenant_id
}

output "client_id" {
  description = "Application Client ID"
  value       = azuread_application.app.client_id
}

output "client_secret" {
  description = "Application Client Secret"
  value       = azuread_application_password.app_password.value
  sensitive   = true
}

output "assigned_subscriptions" {
  description = "List of subscriptions with Reader role assigned"
  value = [
    for sub in data.azurerm_subscriptions.available.subscriptions : {
      name = sub.display_name
      id   = sub.subscription_id
    }
  ]
}