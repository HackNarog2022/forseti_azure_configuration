#output "hacknarog_api_application_id" {
#  value = azuread_application.hacknarog_api.application_id
#}

output "tenant_id" {
  value = data.azurerm_aadb2c_directory.hacknarog.tenant_id
}

output "hacknarog_api_client_secret" {
  value     = azuread_application_password.example.value
  sensitive = true
}