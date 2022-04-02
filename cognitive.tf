resource "azurerm_cognitive_account" "hacknarog" {
  name                = "forseti-text-analysis-account"
  location            = data.azurerm_resource_group.hacknarog.location
  resource_group_name = data.azurerm_resource_group.hacknarog.name
  kind                = "TextAnalytics"
  sku_name            = "S0"
}