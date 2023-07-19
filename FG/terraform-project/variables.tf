# variables.tf: In this file, you can define the input variables that you'll use in your Terraform project. 
# Variables allow you to parameterize your configurations and make them more reusable.

# variables.tf

variable "azure_subscription_id" {
  type        = string
  description = "The Azure subscription ID where the policies and roles will be applied."
}

variable "policy1_definition" {
  type        = string
  description = "The JSON definition of Policy 1."
}

# Define additional variables as needed for other policies and roles.
