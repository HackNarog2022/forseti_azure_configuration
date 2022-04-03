resource "azurerm_cognitive_account" "hacknarog" {
  custom_subdomain_name = "forseti-text-analysis-account"
  name                  = "forseti-text-analysis-account"
  location              = "East US"
  resource_group_name   = data.azurerm_resource_group.hacknarog.name
  kind                  = "TextAnalytics"
  sku_name              = "F0"

  network_acls {
    default_action = "Allow"
    ip_rules       = []
  }

}