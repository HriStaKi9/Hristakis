  terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "wonen-prd-h-sa-hub-rg-01"
    storage_account_name = "wonenprdhsahubst01"
    container_name       = "wonen-prd-h-sa-hub-state-01"
    key                  = "policy_initiative.tfstate"
  }
}

provider "azurerm" {
  features {}
  # Add any other provider settings here if needed
}

# Define the resource group
resource "azurerm_resource_group" "example_rg" {
  name     = "example-resource-group"
  location = "East US"  # Replace with your preferred Azure region
}

# Define the storage account
resource "azurerm_storage_account" "example_storage" {
  name                     = "ickoexamplestorage"  # Replace with your preferred storage account name
  resource_group_name      = azurerm_resource_group.example_rg.name
  location                 = azurerm_resource_group.example_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Define the virtual network
resource "azurerm_virtual_network" "example_vnet" {
  name                = "example-vnet"
  resource_group_name = azurerm_resource_group.example_rg.name
  location            = azurerm_resource_group.example_rg.location
  address_space       = ["10.0.0.0/16"]
}

# Define the subnet within the virtual network
resource "azurerm_subnet" "example_subnet" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = ["10.0.1.0/24"]  # Replace with your preferred subnet CIDR block
}

module "module1" {
  source = "./modules/module_subnet"

  # Add your module1-specific variables here, if any
}

module "module2" {
  source = "./modules/module_Vnet"

  # Add your module2-specific variables here, if any
}

# Module for VNet Peering
module "vnet_peering" {
  source = "./modules/module_peering"

  # Reference to the first VNet module
  vnet1_name = module.module1.vnet_name
  vnet1_rg   = module.module1.resource_group_name

  # Reference to the second VNet module
  vnet2_name = module.module2.vnet_name
  vnet2_rg   = module.module2.resource_group_name
}