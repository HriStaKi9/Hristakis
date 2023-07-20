# main.tf: This file will contain the main configuration for your Terraform project. 
# You'll define the necessary resources, data sources, and other configurations here.
# main.tf
terraform {
  required_version = ">= 0.12"
}

locals {
  environment = var.environment
}

provider "azurerm" {
  features {}
  # Add any other provider settings here if needed
}

module "vnet" {
  source      = "./modules/module1"
  location    = var.location
  environment = var.environment
}

module "subnet" {
  source      = "./modules/module2"
  location    = var.location
  environment = var.environment
}

module "vnet_peering" {
  source      = "./modules/module3"
  environment = var.environment
}

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
