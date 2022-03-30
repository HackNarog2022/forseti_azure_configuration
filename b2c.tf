resource "azurerm_aadb2c_directory" "example" {
  country_code            = "PL"
  data_residency_location = "Global"
  display_name            = "hacknarog-b2c-tenant"
  domain_name             = "hacknarogb2ctenant.onmicrosoft.com"
  resource_group_name     = azurerm_resource_group.hacknarog.name
  sku_name                = "PremiumP1"
}