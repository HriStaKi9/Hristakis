
# policies/policy1/policy_initiative.tf

resource "azurerm_policy_set_definition" "policy_management_group" {
  name                  = "MyPolicyManagementGroup"
  display_name          = "Policy Management Group Initiative"
  policy_type           = "Custom"
  management_group_id   = "management-group-id"  # Replace with the actual management group ID

  policy_rule = jsonencode([
    {
      "policyDefinitionId" = "/providers/Microsoft.Authorization/policyDefinitions/pol-net-dmz-conf-1"
    },
    {
      "policyDefinitionId" = "/providers/Microsoft.Authorization/policyDefinitions/pol-net-dmz-conf-2"
    },
    # Add other policy definition IDs as needed
  ])
}

# Start of parameters
locals {
  included_classification_sets = [
    "pol-net-dmz-conf-1",
    "pol-net-dmz-conf-2",
    # Add other policy definition IDs to the list
  ]
}

# Parameters block
locals {
  ManagedIdentityLocation      = "eastus"  # Replace with the desired location
  IncludedClassificationSets   = local.included_classification_sets
  LogAnalyticsWorkspaceResourceId = ""      # Replace with the actual Log Analytics Workspace Resource ID
  EventHubAuthorizationRuleId     = ""      # Replace with the actual Event Hub Authorization Rule ID
  EventHubLocation                = local.ManagedIdentityLocation
}

# policies/policy1/policy_initiative.tf

locals {
  policySetDefinitionObjectList = [
    # [Azure Policy Initiative] Network DMZ - Confidentiality and integrity - Classification 1
    {
      policySetName                 = "pol-net-dmz-conf-1"
      description                   = "Set of policies to enforce regarding networking from a confidentiality and integrity perspective for information classification 1."
      policyAssignmentRequiresIdentity = true
      roleAssignmentObjectList = [
        {
          roleDefinitionName       = "Virtual Machine Contributor"
          roleDefinitionId         = "9980e02c-c2be-4d73-94e8-173b1dc7cf3c"
        },
        {
          roleDefinitionName       = "Azure Connected Machine Resource Administrator"
          roleDefinitionId         = "cd570a14-e51a-42ad-bac8-bafd67325302"
        },
        {
          roleDefinitionName       = "Security Admin"
          roleDefinitionId         = "fb1c8493-542b-48eb-b624-b4c8fea62acd"
        }
      ]
      parameterDefinitions = {
        AppGwWAFShouldUseSpecifiedMode_Effect = {
          type          = "string"
          metadata = {
            displayName = "AppGwWAFShouldUseSpecifiedMode - Effect"
            description = "The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode."
          }
          allowedValues = ["Audit", "Deny", "Disabled"]
          defaultValue  = "Deny"
        }
        AppGwWAFShouldUseSpecifiedMode_ModeRequirement = {
          type          = "string"
          metadata = {
            displayName = "AppGwWAFShouldUseSpecifiedMode - Mode Requirement"
            description = "Specifies whether the WAF is required to be set to Prevention or Detection."
          }
          allowedValues = ["Prevention", "Detection"]
          defaultValue  = "Prevention"
        }
        AppGwWAFShouldBeEnabled_Effect = {
          type          = "string"
          metadata = {
            displayName = "AppGwWAFShouldBeEnabled - Effect"
            description = "The effect of the Azure Policy AppGwWAFShouldBeEnabled."
          }
          allowedValues = ["Audit", "Deny", "Disabled"]
          defaultValue  = "Audit"
        }
        # Add other parameter definitions as needed
      }
      parameterValues = {
        AppGwWAFShouldUseSpecifiedMode_Effect = {
          value = "Deny"
        }
        AppGwWafShouldUseSpecifiedMode_ModeRequirement = {
          value = "Prevention"
        }
        AppGwWAFShouldBeEnabled_Effect = {
          value = "AuditIfNotExists"
        }
        # Add other parameter values as needed
      }
      policies = [
        {
          policyDisplayName        = "Web Application Firewall (WAF) should use the specified mode for Application Gateway"
          policyDefinitionId       = "/providers/Microsoft.Authorization/policyDefinitions/12430be1-6cc8-4527-a9a8-e3d38f250096"
          policyDefinitionReferenceId = "AppGwWAFShouldUseSpecifiedMode"
          parameters = {
            effect = {
              value = "[[parameters('AppGwWAFShouldUseSpecifiedMode_Effect')]"
            }
            modeRequirement = {
              value = "[[parameters('AppGwWAFShouldUseSpecifiedMode_ModeRequirement')]"
            }
          }
        },
        {
          policyDisplayName        = "Web Application Firewall (WAF) should be enabled for Application Gateway"
          policyDefinitionId       = "/providers/Microsoft.Authorization/policyDefinitions/564feb30-bf6a-4854-b4bb-0d2d2d1e6c66"
          policyDefinitionReferenceId = "AppGwWAFShouldBeEnabled"
          parameters = {
            effect = {
              value = "[[parameters('AppGwWAFShouldBeEnabled_Effect')]"
            }
          }
        },
        # Add other policies as needed
      ]
    }
  ]
}

resource "azurerm_policy_set_definition" "policy_management_group" {
  count                 = length(local.policySetDefinitionObjectList)
  name                  = local.policySetDefinitionObjectList[count.index].policySetName
  display_name          = local.policySetDefinitionObjectList[count.index].policySetName
  policy_type           = "Custom"
  management_group_id   = "management-group-id"  # Replace with the actual management group ID

  policy_rule = jsonencode(local.policySetDefinitionObjectList[count.index].policies)
}

# Start of parameters
locals {
  included_classification_sets = [
    "pol-net-dmz-conf-1",
    "pol-net-dmz-conf-2",
    # Add other policy definition IDs to the list
  ]
}

# Parameters block
locals {
  ManagedIdentityLocation      = "eastus"  # Replace with the desired location
  IncludedClassificationSets   = local.included_classification_sets
  LogAnalyticsWorkspaceResourceId = ""      # Replace with the actual Log Analytics Workspace Resource ID
  EventHubAuthorizationRuleId     = ""      # Replace with the actual Event Hub Authorization Rule ID
  EventHubLocation                = local.ManagedIdentityLocation
}

locals {
  policySetDefinitionObjectList = [
    # [Azure Policy Initiative] Network DMZ - Confidentiality and integrity - Classification 1
    {
      policySetName               = "pol-net-dmz-conf-1"
      description                 = "Set of policies to enforce regarding networking from a confidentiality and integrity perspective for information classification 1."
      policyAssignmentRequiresIdentity = true
      roleAssignmentObjectList    = [
        {
          roleDefinitionName  = "Virtual Machine Contributor"
          roleDefinitionId    = "9980e02c-c2be-4d73-94e8-173b1dc7cf3c"
        },
        {
          roleDefinitionName  = "Azure Connected Machine Resource Administrator"
          roleDefinitionId    = "cd570a14-e51a-42ad-bac8-bafd67325302"
        },
        {
          roleDefinitionName  = "Security Admin"
          roleDefinitionId    = "fb1c8493-542b-48eb-b624-b4c8fea62acd"
        }
      ]
      parameterDefinitions = {
        AppGwWAFShouldUseSpecifiedMode_Effect = {
          type        = "string"
          metadata = {
            displayName = "AppGwWAFShouldUseSpecifiedMode - Effect"
            description = "The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode."
          }
          allowedValues = [
            "Audit",
            "Deny",
            "Disabled",
          ]
          defaultValue = "Deny"
        }
        AppGwWAFShouldUseSpecifiedMode_ModeRequirement = {
          type        = "string"
          metadata = {
            displayName = "AppGwWAFShouldUseSpecifiedMode - Mode Requirement"
            description = "Specifies whether the WAF is required to be set to Prevention or Detection."
          }
          allowedValues = [
            "Prevention",
            "Detection",
          ]
          defaultValue = "Prevention"
        }
        AppGwWAFShouldBeEnabled_Effect = {
          type        = "string"
          metadata = {
            displayName = "AppGwWAFShouldBeEnabled - Effect"
            description = "The effect of the Azure Policy AppGwWAFShouldBeEnabled."
          }
          allowedValues = [
            "Audit",
            "Deny",
            "Disabled",
          ]
          defaultValue = "Audit"
        }
        InternetTrafficShouldBeRoutedViaAzFW_Effect = {
          type        = "string"
          metadata = {
            displayName = "InternetTrafficShouldBeRoutedViaAzFW - Effect"
            description = "The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW."
          }
          allowedValues = [
            "AuditIfNotExists",
            "Disabled",
          ]
          defaultValue = "AuditIfNotExists"
        }
        SubnetShouldBeLinkedToNSG_Effect = {
          type        = "string"
          metadata = {
            displayName = "SubnetShouldBeLinkedToNSG - Effect"
            description = "The effect of the Azure Policy SubnetShouldBeLinkedToNSG."
          }
          allowedValues = [
            "AuditIfNotExists",
            "Disabled",
          ]
          defaultValue = "AuditIfNotExists"
        }
        AntiMalwareForWindowsServerShouldBeDeployed_Effect = {
          type        = "string"
          metadata = {
            displayName = "AntiMalwareForWindowsServerShouldBeDeployed - Effect"
            description = "The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed."
          }
          allowedValues = [
            "AuditIfNotExists",
            "Disabled",
          ]
          defaultValue = "AuditIfNotExists"
        }
        AntiMalwareShouldAutoUpdateSignatures_Effect = {
          type        = "string"
          metadata = {
            displayName = "AntiMalwareShouldAutoUpdateSignatures - Effect"
            description = "The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures."
          }
          allowedValues = [
            "AuditIfNotExists",
            "Disabled",
          ]
          defaultValue = "AuditIfNotExists"
        }
        CloudServicesShouldHaveUpdatesInstalled_Effect = {
          type        = "string"
          metadata = {
            displayName = "CloudServicesShouldHaveUpdatesInstalled - Effect"
            description = "The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled."
          }
          allowedValues = [
            "AuditIfNotExists",
            "Disabled",
          ]
          defaultValue = "AuditIfNotExists"
        }
        SystemUpdatesOnVMsShouldBeInstalled_Effect = {
          type        = "string"
          metadata = {
            displayName = "SystemUpdatesOnVMsShouldBeInstalled - Effect"
            description = "The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled."
          }
          allowedValues = [
            "AuditIfNotExists",
            "Disabled",
          ]
          defaultValue = "AuditIfNotExists"
        }
        SystemUpdatesOnScaleSetsShouldBeInstalled_Effect = {
          type        = "string"
          metadata = {
            displayName = "SystemUpdatesOnScaleSetsShouldBeInstalled - Effect"
            description = "The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled."
          }
          allowedValues = [
            "AuditIfNotExists",
            "Disabled",
          ]
          defaultValue = "AuditIfNotExists"
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode = {
          type        = "string"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode"
            description = "The assessment mode for the virtual machines."
          }
          allowedValues = [
            "ImageDefault",
            "AutomaticByPlatform",
          ]
          defaultValue = "ImageDefault"
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_OsType = {
          type        = "string"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureVMs - Os Type"
            description = "The Os Type of the virtual machines that should be assessed."
          }
          allowedValues = [
            "Windows",
            "Linux",
          ]
          defaultValue = "Windows"
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_Locations = {
          type        = "array"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureVMs - Locations"
            description = "The location(s) of the virtual machines that should be assessed."
          }
          defaultValue = []
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_TagValues = {
          type        = "object"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureVMs - Tags"
            description = "The tags that should be matched for the VMs that should be checked for missing updates."
          }
          defaultValue = {}
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator = {
          type        = "string"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator"
            description = "The assessment mode for the virtual machines."
          }
          allowedValues = [
            "All",
            "Any",
          ]
          defaultValue = "Any"
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode = {
          type        = "string"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode"
            description = "The assessment mode for the virtual machines."
          }
          allowedValues = [
            "ImageDefault",
            "AutomaticByPlatform",
          ]
          defaultValue = "ImageDefault"
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType = {
          type        = "string"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type"
            description = "The Os Type of the virtual machines that should be assessed."
          }
          allowedValues = [
            "Windows",
            "Linux",
          ]
          defaultValue = "Windows"
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations = {
          type        = "array"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations"
            description = "The location(s) of the virtual machines that should be assessed."
          }
          defaultValue = []
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues = {
          type        = "object"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags"
            description = "The tags that should be matched for the VMs that should be checked for missing updates."
          }
          defaultValue = {}
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator = {
          type        = "string"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator"
            description = "The assessment mode for the virtual machines."
          }
          allowedValues = [
            "All",
            "Any",
          ]
          defaultValue = "Any"
        }
        ConfigurePeriodicUpdateChecksForVMs_Effect = {
          type        = "string"
          metadata = {
            displayName = "ConfigurePeriodicUpdateChecksForVMs - Effect"
            description = "The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs."
          }
          allowedValues = [
            "Audit",
            "Disabled",
          ]
          defaultValue = "Audit"
        }
      }
      parameterValues = {
        AppGwWAFShouldUseSpecifiedMode_Effect = {
          value = "Deny"
        }
        AppGwWafShouldUseSpecifiedMode_ModeRequirement = {
          value = "Prevention"
        }
        InternetTrafficShouldBeRoutedViaAzFW_Effect = {
          value = "AuditIfNotExists"
        }
        SubnetShouldBeLinkedToNSG_Effect = {
          value = "AuditIfNotExists"
        }
        AntiMalwareForWindowsServerShouldBeDeployed_Effect = {
          value = "AuditIfNotExists"
        }
        AntiMalwareShouldAutoUpdateSignatures_Effect = {
          value = "AuditIfNotExists"
        }
        CloudServicesShouldHaveUpdatesInstalled_Effect = {
          value = "AuditIfNotExists"
        }
        SystemUpdatesOnVMsShouldBeInstalled_Effect = {
          value = "AuditIfNotExists"
        }
        SystemUpdatesOnScaleSetsShouldBeInstalled_Effect = {
          value = "AuditIfNotExists"
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode = {
          value = "ImageDefault"
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_OsType = {
          value = "Windows"
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_Locations = {
          value = []
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_TagValues = {
          value = {}
        }
        ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator = {
          value = "Any"
        }
        ConfigurePeriodicUpdateChecksForVMs_Effect = {
          value = "Audit"
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode = {
          value = "ImageDefault"
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType = {
          value = "Windows"
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations = {
          value = []
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues = {
          value = {}
        }
        ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator = {
          value = "Any"
        }
      }
      policies = [
        {
          policyDisplayName          = "Web Application Firewall (WAF) should use the specified mode for Application Gateway"
          policyDefinitionId         = "12430be1-6cc8-4527-a9a8-e3d38f250096"
          policyDefinitionReferenceId = "AppGwWAFShouldUseSpecifiedMode"
          parameters = {
            effect = {
              value = "[[parameters('AppGwWAFShouldUseSpecifiedMode_Effect')]"
            }
            modeRequirement = {
              value = "[[parameters('AppGwWAFShouldUseSpecifiedMode_ModeRequirement')]"
            }
          }
        },
        {
          policyDisplayName          = "Web Application Firewall (WAF) should be enabled for Application Gateway"
          policyDefinitionId         = "564feb30-bf6a-4854-b4bb-0d2d2d1e6c66"
          policyDefinitionReferenceId = "AppGwWAFShouldBeEnabled"
          parameters = {
            effect = {
              value = "[[parameters('AppGwWAFShouldBeEnabled_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "[Preview]: All Internet traffic should be routed via your deployed Azure Firewall"
          policyDefinitionId         = "fc5e4038-4584-4632-8c85-c0448d374b2c"
          policyDefinitionReferenceId = "InternetTrafficShouldBeRoutedViaAzFW"
          parameters = {
            effect = {
              value = "[[parameters('InternetTrafficShouldBeRoutedViaAzFW_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "Subnets should be associated with a Network Security Group"
          policyDefinitionId         = "e71308d3-144b-4262-b144-efdc3cc90517"
          policyDefinitionReferenceId = "SubnetShouldBeLinkedToNSG"
          parameters = {
            effect = {
              value = "[[parameters('SubnetShouldBeLinkedToNSG_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "Deploy default Microsoft IaaSAntimalware extension for Windows Server"
          policyDefinitionId         = "2835b622-407b-4114-9198-6f7064cbe0dc"
          policyDefinitionReferenceId = "DeployAntiMalwareForWindowsServer"
        },
        {
          policyDisplayName          = "Microsoft IaaSAntimalware extension should be deployed on Windows servers"
          policyDefinitionId         = "9b597639-28e4-48eb-b506-56b05d366257"
          policyDefinitionReferenceId = "AntiMalwareForWindowsServerShouldBeDeployed"
          parameters = {
            effect = {
              value = "[[parameters('AntiMalwareForWindowsServerShouldBeDeployed_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "Microsoft Antimalware for Azure should be configured to automatically update protection signatures"
          policyDefinitionId         = "c43e4a30-77cb-48ab-a4dd-93f175c63b57"
          policyDefinitionReferenceId = "AntiMalwareShouldAutoUpdateSignatures"
          parameters = {
            effect = {
              value = "[[parameters('AntiMalwareShouldAutoUpdateSignatures_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "Cloud Services (extended support) role instances should have system updates installed"
          policyDefinitionId         = "4df26ba8-026d-45b0-9521-bffa44d741d2"
          policyDefinitionReferenceId = "CloudServicesShouldHaveUpdatesInstalled"
          parameters = {
            effect = {
              value = "[[parameters('CloudServicesShouldHaveUpdatesInstalled_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "System updates should be installed on your machines"
          policyDefinitionId         = "86b3d65f-7626-441e-b690-81a8b71cff60"
          policyDefinitionReferenceId = "SystemUpdatesOnVMsShouldBeInstalled"
          parameters = {
            effect = {
              value = "[[parameters('SystemUpdatesOnVMsShouldBeInstalled_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "System updates on virtual machine scale sets should be installed"
          policyDefinitionId         = "c3f317a7-a95c-4547-b7e7-11017ebdf2fe"
          policyDefinitionReferenceId = "SystemUpdatesOnScaleSetsShouldBeInstalled"
          parameters = {
            effect = {
              value = "[[parameters('SystemUpdatesOnScaleSetsShouldBeInstalled_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "[Preview]: Configure periodic checking for missing system updates on azure virtual machines"
          policyDefinitionId         = "59efceea-0c96-497e-a4a1-4eb2290dac15"
          policyDefinitionReferenceId = "ConfigurePeriodicUpdateChecksForAzureVMs"
          parameters = {
            assessmentMode = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode')]"
            }
            osType = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureVMs_OsType')]"
            }
            locations = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureVMs_Locations')]"
            }
            tagValues = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureVMs_TagValues')]"
            }
            tagOperator = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator')]"
            }
          }
        },
        {
          policyDisplayName          = "[Preview]: Machines should be configured to periodically check for missing system updates"
          policyDefinitionId         = "bd876905-5b84-4f73-ab2d-2e7a7c4568d9"
          policyDefinitionReferenceId = "ConfigurePeriodicUpdateChecksForVMs"
          parameters = {
            effect = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForVMs_Effect')]"
            }
          }
        },
        {
          policyDisplayName          = "[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers"
          policyDefinitionId         = "bfea026e-043f-4ff4-9d1b-bf301ca7ff46"
          policyDefinitionReferenceId = "ConfigurePeriodicUpdateChecksForAzureArcVMs"
          parameters = {
            assessmentMode = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode')]"
            }
            osType = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType')]"
            }
            locations = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations')]"
            }
            tagValues = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues')]"
            }
            tagOperator = {
              value = "[[parameters('ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator')]"
            }
          }
        }
      ]
    }
  ]
}


# Define variables
variable "AppGwWAFShouldUseSpecifiedMode_Effect" {
  type    = string
  default = "Deny"
}

variable "AppGwWAFShouldUseSpecifiedMode_ModeRequirement" {
  type    = string
  default = "Prevention"
}

variable "AppGwWAFShouldBeEnabled_Effect" {
  type    = string
  default = "Audit"
}

variable "InternetTrafficShouldBeRoutedViaAzFW_Effect" {
  type    = string
  default = "AuditIfNotExists"
}

variable "SubnetShouldBeLinkedToNSG_Effect" {
  type    = string
  default = "AuditIfNotExists"
}

variable "AntiMalwareForWindowsServerShouldBeDeployed_Effect" {
  type    = string
  default = "AuditIfNotExists"
}

variable "AntiMalwareShouldAutoUpdateSignatures_Effect" {
  type    = string
  default = "AuditIfNotExists"
}

variable "CloudServicesShouldHaveUpdatesInstalled_Effect" {
  type    = string
  default = "AuditIfNotExists"
}

variable "SystemUpdatesOnVMsShouldBeInstalled_Effect" {
  type    = string
  default = "AuditIfNotExists"
}

variable "SystemUpdatesOnScaleSetsShouldBeInstalled_Effect" {
  type    = string
  default = "AuditIfNotExists"
}

variable "ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode" {
  type    = string
  default = "ImageDefault"
}

variable "ConfigurePeriodicUpdateChecksForAzureVMs_OsType" {
  type    = string
  default = "Windows"
}

variable "ConfigurePeriodicUpdateChecksForAzureVMs_Locations" {
  type    = list(string)
  default = []
}

variable "ConfigurePeriodicUpdateChecksForAzureVMs_TagValues" {
  type    = map(string)
  default = {}
}

variable "ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator" {
  type    = string
  default = "Any"
}

variable "ConfigurePeriodicUpdateChecksForVMs_Effect" {
  type    = string
  default = "Audit"
}

variable "ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode" {
  type    = string
  default = "ImageDefault"
}

variable "ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType" {
  type    = string
  default = "Windows"
}

variable "ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations" {
  type    = list(string)
  default = []
}

variable "ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues" {
  type    = map(string)
  default = {}
}

variable "ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator" {
  type    = string
  default = "Any"
}

# Azure Policy Initiative and Policies
resource "azurerm_policy_set_definition" "policy_initiative" {
  name        = "pol-net-dmz-dataconf-1"
  display_name = "Network DMZ - Data Confidentiality - Classification 1"
  description = "Set of policies to enforce regarding networking from a data confidentiality perspective for information classification 1."

  metadata {
    category = "General"
  }

  policy_type = "Custom"

  parameter {
    name  = "AppGwWAFShouldUseSpecifiedMode_Effect"
    type  = "String"
    value = var.AppGwWAFShouldUseSpecifiedMode_Effect
  }

  parameter {
    name  = "AppGwWAFShouldUseSpecifiedMode_ModeRequirement"
    type  = "String"
    value = var.AppGwWAFShouldUseSpecifiedMode_ModeRequirement
  }

  parameter {
    name  = "AppGwWAFShouldBeEnabled_Effect"
    type  = "String"
    value = var.AppGwWAFShouldBeEnabled_Effect
  }

  parameter {
    name  = "InternetTrafficShouldBeRoutedViaAzFW_Effect"
    type  = "String"
    value = var.InternetTrafficShouldBeRoutedViaAzFW_Effect
  }

  parameter {
    name  = "SubnetShouldBeLinkedToNSG_Effect"
    type  = "String"
    value = var.SubnetShouldBeLinkedToNSG_Effect
  }

  parameter {
    name  = "AntiMalwareForWindowsServerShouldBeDeployed_Effect"
    type  = "String"
    value = var.AntiMalwareForWindowsServerShouldBeDeployed_Effect
  }

  parameter {
    name  = "AntiMalwareShouldAutoUpdateSignatures_Effect"
    type  = "String"
    value = var.AntiMalwareShouldAutoUpdateSignatures_Effect
  }

  parameter {
    name  = "CloudServicesShouldHaveUpdatesInstalled_Effect"
    type  = "String"
    value = var.CloudServicesShouldHaveUpdatesInstalled_Effect
  }

  parameter {
    name  = "SystemUpdatesOnVMsShouldBeInstalled_Effect"
    type  = "String"
    value = var.SystemUpdatesOnVMsShouldBeInstalled_Effect
  }

  parameter {
    name  = "SystemUpdatesOnScaleSetsShouldBeInstalled_Effect"
    type  = "String"
    value = var.SystemUpdatesOnScaleSetsShouldBeInstalled_Effect
  }

  parameter {
    name  = "ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode"
    type  = "String"
    value = var.ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode
  }

  parameter {
    name  = "ConfigurePeriodicUpdateChecksForAzureVMs_OsType"
    type  = "String"
    value = var.ConfigurePeriodicUpdateChecksForAzureVMs_OsType
  }

  parameter {
    name  = "ConfigurePeriodicUpdateChecksForAzureVMs_Locations"
    type  = "Array"
    value = var.ConfigurePeriodicUpdateChecksForAzureVMs_Locations
  }

  parameter {
    name  = "ConfigurePeriodicUpdateChecksForAzureVMs_TagValues"
    type  = "Object"
    value = var.ConfigurePeriodicUpdateChecksForAzureVMs_TagValues
  }

  parameter {
    name  = "ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator"
    type  = "String"
    value = var.ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator
  }

  parameter {
    name  = "ConfigurePeriodicUpdateChecksForVMs_Effect"
    type  = "String"
    value = var.ConfigurePeriodicUpdateChecksForVMs_Effect
  }

  policy_definition_reference {
    policy_definition_id = "12430be1-6cc8-4527-a9a8-e3d38f250096"
    policy_definition_name = "AppGwWAFShouldUseSpecifiedMode"
  }

  policy_definition_reference {
    policy_definition_id = "564feb30-bf6a-4854-b4bb-0d2d2d1e6c66"
    policy_definition_name = "AppGwWAFShouldBeEnabled"
  }

  policy_definition_reference {
    policy_definition_id = "fc5e4038-4584-4632-8c85-c0448d374b2c"
    policy_definition_name = "InternetTrafficShouldBeRoutedViaAzFW"
  }

  policy_definition_reference {
    policy_definition_id = "e71308d3-144b-4262-b144-efdc3cc90517"
    policy_definition_name = "SubnetShouldBeLinkedToNSG"
  }

  policy_definition_reference {
    policy_definition_id = "2835b622-407b-4114-9198-6f7064cbe0dc"
    policy_definition_name = "DeployAntiMalwareForWindowsServer"
  }

  policy_definition_reference {
    policy_definition_id = "9b597639-28e4-48eb-b506-56b05d366257"
    policy_definition_name = "AntiMalwareForWindowsServerShouldBeDeployed"
  }

  policy_definition_reference {
    policy_definition_id = "c43e4a30-77cb-48ab-a4dd-93f175c63b57"
    policy_definition_name = "AntiMalwareShouldAutoUpdateSignatures"
  }

  policy_definition_reference {
    policy_definition_id = "4df26ba8-026d-45b0-9521-bffa44d741d2"
    policy_definition_name = "CloudServicesShouldHaveUpdatesInstalled"
  }

  policy_definition_reference {
    policy_definition_id = "86b3d65f-7626-441e-b690-81a8b71cff60"
    policy_definition_name = "SystemUpdatesOnVMsShouldBeInstalled"
  }

  policy_definition_reference {
    policy_definition_id = "c3f317a7-a95c-4547-b7e7-11017ebdf2fe"
    policy_definition_name = "SystemUpdatesOnScaleSetsShouldBeInstalled"
  }

  policy_definition_reference {
    policy_definition_id = "59efceea-0c96-497e-a4a1-4eb2290dac15"
    policy_definition_name = "ConfigurePeriodicUpdateChecksForAzureVMs"
  }

  policy_definition_reference {
    policy_definition_id = "bd876905-5b84-4f73-ab2d-2e7a7c4568d9"
    policy_definition_name = "ConfigurePeriodicUpdateChecksForVMs"
  }

  policy_definition_reference {
    policy_definition_id = "bfea026e-043f-4ff4-9d1b-bf301ca7ff46"
    policy_definition_name = "ConfigurePeriodicUpdateChecksForAzureArcVMs"
  }
}
