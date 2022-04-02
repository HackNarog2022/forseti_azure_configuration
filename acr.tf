resource "azurerm_container_registry" "acr" {
  name                = "hacknarog2022acr"
  resource_group_name = data.azurerm_resource_group.hacknarog.name
  location            = data.azurerm_resource_group.hacknarog.location
  sku                 = "Basic"
  admin_enabled       = true
}