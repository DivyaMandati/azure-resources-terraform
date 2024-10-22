data "azurerm_subscription" "current" {}

data "azurerm_managed_api" "managed_api" {
  name     = var.api_type
  location = var.location
}
