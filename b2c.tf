# Provider wasn't able to create all the needed resources such as user flows so the configuration is incomplete and was created from the UI
data "azurerm_aadb2c_directory" "hacknarog" {
  resource_group_name = data.azurerm_resource_group.hacknarog.name
  domain_name         = "hacknarog2022.onmicrosoft.com"
}

# During hackaton created through the UI and imported so might not work properly
resource "azuread_application" "hacknarog_api" {
  display_name                   = "HackNarog API"
  sign_in_audience               = "AzureADandPersonalMicrosoftAccount"
  identifier_uris                = ["https://hacknarog2022.onmicrosoft.com/api"]
  fallback_public_client_enabled = true

  owners = [
    "7adf0d1a-015f-4bed-8e1f-099e987d41c5", # should be from data
    "6a26c6ff-d6d7-4336-9720-84c1445eacee"
  ]
  
  api {
    requested_access_token_version = 2

    oauth2_permission_scope {
      id                         = "e774bd94-3f34-40d3-acc0-13a8b803beed"
      type                       = "Admin"
      value                      = "access_as_user"
      admin_consent_description  = "Allows the app to access HackNarog API as the signed-in user."
      admin_consent_display_name = "Access HackNarog API"
      enabled                    = true
    }
  }

  web {
    redirect_uris = [
      "http://localhost:8080/",
      "https://forsetihacknarog.azurewebsites.net/",
      "https://jwt.ms/",
    ]

    implicit_grant {
      access_token_issuance_enabled = true
      id_token_issuance_enabled     = true
    }
  }

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "7427e0e9-2fba-42fe-b0c0-848c9e6a8182"
      type = "Scope"
    }
    resource_access {
      id   = "37f7f235-527c-4136-accd-4a02d197296e"
      type = "Scope"
    }
    resource_access {
      id   = "df021288-bdef-4463-88db-98f22de89214"
      type = "Role"
    }
    resource_access {
      id   = "7ab1d382-f21e-4acd-a863-ba3e13f7da61"
      type = "Role"
    }
  }
  required_resource_access {
    resource_app_id = "04d120b4-f06a-47ef-be91-591dab140219"

    resource_access {
      id   = "e774bd94-3f34-40d3-acc0-13a8b803beed"
      type = "Scope"
    }
  }
}

# During hackaton created through the UI and imported so might not work properly
resource "azuread_application" "forseti_frontend" {
  display_name     = "ForsetiFrontend"
  sign_in_audience = "AzureADandPersonalMicrosoftAccount"

  owners = [
    "7adf0d1a-015f-4bed-8e1f-099e987d41c5", # should be from data
  ]

  api {
    known_client_applications      = []
    mapped_claims_enabled          = false
    requested_access_token_version = 2
  }

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "37f7f235-527c-4136-accd-4a02d197296e"
      type = "Scope"
    }
    resource_access {
      id   = "7427e0e9-2fba-42fe-b0c0-848c9e6a8182"
      type = "Scope"
    }
  }

  required_resource_access {
    resource_app_id = "04d120b4-f06a-47ef-be91-591dab140219"

    resource_access {
      id   = "e774bd94-3f34-40d3-acc0-13a8b803beed"
      type = "Scope"
    }
  }

  single_page_application {
    redirect_uris = [
      "http://localhost:4200/",
      "https://forsetihacknarog.azurewebsites.net/",
    ]
  }
}
