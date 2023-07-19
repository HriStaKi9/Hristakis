# roles/role1.tf

resource "azurerm_role_assignment" "example" {
  scope                = "/subscriptions/${var.azure_subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = "principal_id_of_the_user_or_service_principal"
}
