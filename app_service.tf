resource "azurerm_app_service_plan" "hacknarog" {
  name                = "forseti-appserviceplan"
  location            = data.azurerm_resource_group.hacknarog.location
  resource_group_name = data.azurerm_resource_group.hacknarog.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = data.azurerm_resource_group.hacknarog.location
  resource_group_name = data.azurerm_resource_group.hacknarog.name
  app_service_plan_id = azurerm_app_service_plan.hacknarog.id

  site_config {
    linux_fx_version = "COMPOSE|${base64encode(templatefile("docker-compose.yml", {
      MONGO_URI = azurerm_cosmosdb_account.hacknarog.connection_strings[0]
    }))}"
  }
}