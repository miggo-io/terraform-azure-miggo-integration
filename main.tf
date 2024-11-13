resource "azuread_service_principal" "reader" {
  client_id = var.client_id
  use_existing   = true
}

resource "azurerm_role_assignment" "reader" {
  for_each             = { for sub in data.azurerm_subscriptions.available.subscriptions : sub.subscription_id => sub }
  scope                = "/subscriptions/${each.key}"
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.reader.object_id
}