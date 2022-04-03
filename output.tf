output "tenant_id" {
  value = data.azurerm_aadb2c_directory.hacknarog.tenant_id
}

output "docker_compose_app_settings_template" {
  value = templatefile("docker-compose.yml", {
    MONGO_URI     = azurerm_cosmosdb_account.hacknarog.connection_strings[0]
    SENTIMENT_KEY = azurerm_cognitive_account.hacknarog.primary_access_key
  })
  sensitive = true
}