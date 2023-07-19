#In the backend.tf file, you need to specify the details for storing the Terraform state file remotely in Azure. 
#This configuration allows you to collaborate with others and safely manage the state of your infrastructure. 
#Replace the resource_group_name, storage_account_name, and container_name with the appropriate names for your Azure storage account configuration.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"   # Change to the name of your resource group for storing state
    storage_account_name = "tfstatestore" # Change to the name of your storage account for storing state
    container_name       = "tfstate"      # Change to the name of your container for storing state
    key                  = "policy_initiative.tfstate" # Change to a unique name for this state file
  }
}
