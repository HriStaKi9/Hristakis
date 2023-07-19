# providers.tf: In this file, you'll configure the Azure provider. 
# This is where you'll set up the connection to your Azure subscription, specifying the required credentials and other provider-specific settings.

# providers.tf

provider "azurerm" {
  features {}
  subscription_id = "d80a40b8-d00d-45f1-b53e-5356c7fef31e"
  # Optionally, you can specify other authentication details like client_id, client_secret, and tenant_id.
  # If not specified here, Terraform will use the default authentication mechanism provided by the Azure CLI.
}
