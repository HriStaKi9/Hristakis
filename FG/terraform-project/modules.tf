provider "azurerm" {
  features {}
}

module "policy_initiative1" {
  source = "./modules/policy_initiative"

  name        = local.policySetDefinitionObjectList[0].policySetName
  description = local.policySetDefinitionObjectList[0].description
  policies    = local.policySetDefinitionObjectList[0].policies
  parameters  = local.policySetDefinitionObjectList[0].parameterValues
}

module "policy_initiative2" {
  source = "./modules/policy_initiative"

  name        = local.policySetDefinitionObjectList[1].policySetName
  description = local.policySetDefinitionObjectList[1].description
  policies    = local.policySetDefinitionObjectList[1].policies
  parameters  = local.policySetDefinitionObjectList[1].parameterValues
}

# Add other policy initiatives, policy assignments, and other resources as needed.

"appId": "67109c4b-54f1-4203-aa93-e86f964cfdfc",
  "displayName": "terraform_spn",
  "password": "XCz8Q~9TAlcqlQIS8C~Ly9eAAubrKCEtNKH4nb_N",
  "tenant": "93f33571-550f-43cf-b09f-cd331338d086"