# main.tf: This file will contain the main configuration for your Terraform project. 
# You'll define the necessary resources, data sources, and other configurations here.

# main.tf

provider "azurerm" {
  features {}
}

# Set the Azure subscription ID using the variable defined in variables.tf
provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

# Call policy and role configurations
module "policies" {
  source = "./policies"
  # If you have additional input variables for the policies module, pass them here.
}

module "roles" {
  source = "./roles"
  # If you have additional input variables for the roles module, pass them here.
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
