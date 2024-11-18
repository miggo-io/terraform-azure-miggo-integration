resource "azuread_application" "app" {
  display_name = "${var.app_name_prefix}-${formatdate("YYYY-MM-DD", timestamp())}"

  required_resource_access {
    resource_app_id = "797f4846-ba00-4fd7-ba43-dac1f8f63013" # Azure Service Management API

    resource_access {
      id   = "41094075-9dad-400e-a0bd-54e686782033" # user_impersonation
      type = "Scope"
    }
  }
}

resource "azuread_application_password" "app_password" {
  display_name   = var.secret_display_name
  end_date      = timeadd(timestamp(), "${var.secret_validity_hours}h")
  application_id = azuread_application.app.id
}

resource "azuread_service_principal" "reader" {
  client_id = azuread_application.app.client_id
}

data "azurerm_subscriptions" "available" {}
data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "reader" {
  for_each             = { for sub in data.azurerm_subscriptions.available.subscriptions : sub.subscription_id => sub }
  scope                = "/subscriptions/${each.key}"
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.reader.id
}