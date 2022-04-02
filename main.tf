terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = data.azurerm_aadb2c_directory.hacknarog.tenant_id
}

data "azurerm_resource_group" "hacknarog" {
  name = "hacknarog"
}