data "azurerm_aadb2c_directory" "hacknarog" {
  resource_group_name = data.azurerm_resource_group.hacknarog.name
  domain_name         = "hacknarog2022.onmicrosoft.com"
}

resource "random_uuid" "api_scope_id" {}

# TODO: import
#resource "azuread_application" "hacknarog_api" {
#  display_name     = "HackNarog API"
#  sign_in_audience = "AzureADMyOrg"
#  identifier_uris  = ["https://hacknarog2022.onmicrosoft.com/api"]
#
#  api {
#    requested_access_token_version = 2
#    
#    oauth2_permission_scope {
#      id                         = random_uuid.api_scope_id.result
#      type                       = "Admin"
#      value                      = "access_as_user"
#      admin_consent_description  = "Allows the app to access HackNarog API as the signed-in user."
#      admin_consent_display_name = "Access HackNarog API"
#      user_consent_description   = "Allow the application to access HackNarog API on your behalf."
#      user_consent_display_name  = "Access HackNarog API"
#      enabled                    = true
#    }
#    
#  }
#}

data "azuread_application" "forseti_api" {
  display_name = "HackNarog API"
}

resource "azuread_application_password" "example" {
  application_object_id = data.azuread_application.forseti_api.object_id
}