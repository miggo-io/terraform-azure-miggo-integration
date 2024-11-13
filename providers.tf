provider "azuread" {
  client_id = "YOUR_HARDCODED_CLIENT_ID_HERE"
}

provider "azurerm" {
  client_id = "YOUR_HARDCODED_CLIENT_ID_HERE"
  features {}
}