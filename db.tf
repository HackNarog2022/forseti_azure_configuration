resource "azurerm_cosmosdb_account" "hacknarog" {
  name                = "hacknarog-cosmos-db-${var.env}"
  location            = "East US"
  resource_group_name = data.azurerm_resource_group.hacknarog.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  enable_automatic_failover = false

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "East US"
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_mongo_database" "hacknarog" {
  name                = "forseti"
  resource_group_name = azurerm_cosmosdb_account.hacknarog.resource_group_name
  account_name        = azurerm_cosmosdb_account.hacknarog.name
  throughput          = 400
}