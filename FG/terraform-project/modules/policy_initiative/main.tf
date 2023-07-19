# modules/policy_initiative/main.tf

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

resource "azurerm_policy_set_definition" "policy_initiative" {
  name        = var.name
  description = var.description
}

resource "azurerm_policy_assignment" "policy_initiative_assignment" {
  for_each          = toset([for policy in var.policies : policy.policyDefinitionId])
  policy_set_definition_id = azurerm_policy_set_definition.policy_initiative.id
  policy_definition_id      = each.key
  name                      = each.value.policyDisplayName
  parameters                = each.value.parameters
}

locals {
  parameter_names = flatten([
    for param_key, param_value in var.parameters : [
      for policy_key, policy_value in var.policies : {
        name     = param_key
        value    = policy_value.parameters[param_key].value
        required = can(var.parameters[param_key][policy_key])
      }
    ]
  ])
}

resource "azurerm_policy_assignment" "policy_initiative_parameters" {
  for_each          = { for i, p in local.parameter_names : i => p }
  policy_set_definition_id = azurerm_policy_set_definition.policy_initiative.id
  policy_definition_id      = each.value.policyDefinitionId
  name                      = "Policy parameter assignment for ${each.value.policyDisplayName}"
  policy_assignment_name    = "parameterAssignment${each.key + 1}"
  description               = "Assignment of parameter values for ${each.value.policyDisplayName}"

  parameters = {
    for k, v in var.parameters : k => {
      for i, p in v : i => {
        if p.required {
          value = p.value
        }
        else {
          value = each.value.parameters[k][i].value
        }
      }
    }
  }
}

output "policy_set_definition_id" {
  value = azurerm_policy_set_definition.policy_initiative.id
}
