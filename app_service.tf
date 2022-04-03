resource "azurerm_app_service_plan" "hacknarog" {
  name                = "forseti-appserviceplan"
  location            = data.azurerm_resource_group.hacknarog.location
  resource_group_name = data.azurerm_resource_group.hacknarog.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# During hackaton created through the UI and imported so might not work properly 
resource "azurerm_app_service" "hacknarog" {
  name                = "Forsetihacknarog"
  location            = data.azurerm_resource_group.hacknarog.location
  resource_group_name = data.azurerm_resource_group.hacknarog.name
  app_service_plan_id = azurerm_app_service_plan.hacknarog.id

  app_settings = {
    DOCKER_REGISTRY_SERVER_USERNAME     = azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD     = azurerm_container_registry.acr.admin_password
    DOCKER_REGISTRY_SERVER_URL          = azurerm_container_registry.acr.login_server
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  }

  site_config {
    linux_fx_version = "COMPOSE|${base64encode(templatefile("docker-compose.yml", {
      MONGO_URI     = azurerm_cosmosdb_account.hacknarog.connection_strings[0]
      SENTIMENT_KEY = azurerm_cognitive_account.hacknarog.primary_access_key
    }))}"
  }
}