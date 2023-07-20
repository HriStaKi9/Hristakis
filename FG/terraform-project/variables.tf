
# Define additional variables as needed for other policies and roles.

variable "location" {
  description = "The Azure region where resources will be created."
}

variable "environment" {
  description = "The environment (e.g., dev, staging, production)."
  default     = "dev"
}
