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
