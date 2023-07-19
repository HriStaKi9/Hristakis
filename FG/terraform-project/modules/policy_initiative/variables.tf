# modules/policy_initiative/variables.tf

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "policies" {
  type = list(object({
    policyDisplayName          = string
    policyDefinitionId         = string
    policyDefinitionReferenceId = string
    parameters                 = map(string)
  }))
}

variable "parameters" {
  type = map(map(string))
}

# modules/policy_initiative/outputs.tf

output "policy_set_definition_id" {
  value = azurerm_policy_set_definition.policy_initiative.id
}
