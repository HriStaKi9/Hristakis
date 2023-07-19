// Target scope - Management group
targetScope = 'managementGroup'

// Start of parameters
param ManagedIdentityLocation string
// Using abbreviated names because of policy assignment length limitation of 24 characters
@allowed([
  'pol-net-dmz-conf-1'
  'pol-net-dmz-conf-2'
  'pol-net-dmz-conf-3'
  'pol-net-dmz-conf-4'
  'pol-net-dmz-conf-5'
  'pol-net-dmz-dataconf-1'
  'pol-net-dmz-dataconf-2'
  'pol-net-dmz-dataconf-3'
  'pol-net-dmz-dataconf-4'
  'pol-net-dmz-dataconf-5'
  'pol-crypt-conf-1'
  'pol-crypt-conf-2'
  'pol-crypt-conf-3'
  'pol-crypt-conf-4'
  'pol-crypt-conf-5'
  'pol-crypt-conf-gdpr-1'
  'pol-crypt-conf-gdpr-2'
  'pol-crypt-conf-gdpr-3'
  'pol-crypt-conf-gdpr-4'
  'pol-crypt-conf-gdpr-5'
  'pol-crypt-integr-1'
  'pol-crypt-integr-2'
  'pol-crypt-integr-3'
  'pol-crypt-integr-4'
  'pol-crypt-integr-5'
  'pol-crypt-integr-gdpr-1'
  'pol-crypt-integr-gdpr-2'
  'pol-crypt-integr-gdpr-3'
  'pol-crypt-integr-gdpr-4'
  'pol-crypt-integr-gdpr-5'
  'pol-keymgmt-conf-1'
  'pol-keymgmt-conf-2'
  'pol-keymgmt-conf-3'
  'pol-keymgmt-conf-4'
  'pol-keymgmt-conf-5'
  'pol-keymgmt-integr-1'
  'pol-keymgmt-integr-2'
  'pol-keymgmt-integr-3'
  'pol-keymgmt-integr-4'
  'pol-keymgmt-integr-5'
])
param IncludedClassificationSets array = [
  'pol-net-dmz-conf-1'
  'pol-net-dmz-conf-2'
  'pol-net-dmz-conf-3'
  'pol-net-dmz-conf-4'
  'pol-net-dmz-conf-5'
  'pol-net-dmz-dataconf-1'
  'pol-net-dmz-dataconf-2'
  'pol-net-dmz-dataconf-3'
  'pol-net-dmz-dataconf-4'
  'pol-net-dmz-dataconf-5'
  'pol-crypt-conf-1'
  'pol-crypt-conf-2'
  'pol-crypt-conf-3'
  'pol-crypt-conf-4'
  'pol-crypt-conf-5'
  'pol-crypt-conf-gdpr-1'
  'pol-crypt-conf-gdpr-2'
  'pol-crypt-conf-gdpr-3'
  'pol-crypt-conf-gdpr-4'
  'pol-crypt-conf-gdpr-5'
  'pol-crypt-integr-1'
  'pol-crypt-integr-2'
  'pol-crypt-integr-3'
  'pol-crypt-integr-4'
  'pol-crypt-integr-5'
  'pol-crypt-integr-gdpr-1'
  'pol-crypt-integr-gdpr-2'
  'pol-crypt-integr-gdpr-3'
  'pol-crypt-integr-gdpr-4'
  'pol-crypt-integr-gdpr-5'
  'pol-keymgmt-conf-1'
  'pol-keymgmt-conf-2'
  'pol-keymgmt-conf-3'
  'pol-keymgmt-conf-4'
  'pol-keymgmt-conf-5'
  'pol-keymgmt-integr-1'
  'pol-keymgmt-integr-2'
  'pol-keymgmt-integr-3'
  'pol-keymgmt-integr-4'
  'pol-keymgmt-integr-5'
]
param LogAnalyticsWorkspaceResourceId string = ''
param EventHubAuthorizationRuleId string = ''
param EventHubLocation string = ManagedIdentityLocation
// End of parameters

// Start of variables
var policySetDefinitionObjectList = [
  // [Azure Policy Initiative] Network DMZ - Confidentiality and integrity - Classification 1
  {
    policySetName: 'pol-net-dmz-conf-1'
    description: 'Set of policies to enforce regarding networking from a confidentiality and integrity perspective for information classification 1.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
    ]
  }
  // [Azure Policy Initiative] Network DMZ - Confidentiality and integrity - Classification 2
  {
    policySetName: 'pol-net-dmz-conf-2'
    description: 'Set of policies to enforce regarding networking from a confidentiality and integrity perspective for information classification 2.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
    ]
  }
  // [Azure Policy Initiative] Network DMZ - Confidentiality and integrity - Classification 3
  {
    policySetName: 'pol-net-dmz-conf-3'
    description: 'Set of policies to enforce regarding networking from a confidentiality and integrity perspective for information classification 3.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Assessment Provider Type'
          description: 'The vulnerability assessment solution to provision to the machines.'
        }
        allowedValues: [
          'default'
          'mdeTvm'
        ]
        defaultValue: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VulnerabilityAssessmentShouldBeEnabledForVMs - Effect'
          description: 'The effect of the Azure Policy VulnerabilityAssessmentShouldBeEnabledForVMs.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        value: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        value: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        value: 'AuditIfNotExists'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure machines to receive a vulnerability assessment provider'
        policyDefinitionId: '13ce0167-8ca6-4048-8e6b-f996402e3c1b'
        policyDefinitionReferenceId: 'ConfigureVulnerabilityAssessmentProviderForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_Effect\')]'
          }
          vaType: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType\')]'
          }
        }
      }
      {
        policyDisplayName: 'A vulnerability assessment solution should be enabled on your virtual machines'
        policyDefinitionId: '501541f7-f7e7-4cd6-868c-4190fdad3ac9'
        policyDefinitionReferenceId: 'VulnerabilityAssessmentShouldBeEnabledForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'VulnerabilityAssessmentShouldBeEnabledForVMs_Effect\')]'
          }
        }
      }
    ]
  }
  // [Azure Policy Initiative] Network DMZ - Confidentiality and integrity - Classification 4
  {
    policySetName: 'pol-net-dmz-conf-4'
    description: 'Set of policies to enforce regarding networking from a confidentiality and integrity perspective for information classification 4.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Assessment Provider Type'
          description: 'The vulnerability assessment solution to provision to the machines.'
        }
        allowedValues: [
          'default'
          'mdeTvm'
        ]
        defaultValue: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VulnerabilityAssessmentShouldBeEnabledForVMs - Effect'
          description: 'The effect of the Azure Policy VulnerabilityAssessmentShouldBeEnabledForVMs.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        value: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        value: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        value: 'AuditIfNotExists'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure machines to receive a vulnerability assessment provider'
        policyDefinitionId: '13ce0167-8ca6-4048-8e6b-f996402e3c1b'
        policyDefinitionReferenceId: 'ConfigureVulnerabilityAssessmentProviderForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_Effect\')]'
          }
          vaType: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType\')]'
          }
        }
      }
      {
        policyDisplayName: 'A vulnerability assessment solution should be enabled on your virtual machines'
        policyDefinitionId: '501541f7-f7e7-4cd6-868c-4190fdad3ac9'
        policyDefinitionReferenceId: 'VulnerabilityAssessmentShouldBeEnabledForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'VulnerabilityAssessmentShouldBeEnabledForVMs_Effect\')]'
          }
        }
      }
    ]
  }
  // [Azure Policy Initiative] Network DMZ - Confidentiality and integrity - Classification 5
  {
    policySetName: 'pol-net-dmz-conf-5'
    description: 'Set of policies to enforce regarding networking from a confidentiality and integrity perspective for information classification 5.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Assessment Provider Type'
          description: 'The vulnerability assessment solution to provision to the machines.'
        }
        allowedValues: [
          'default'
          'mdeTvm'
        ]
        defaultValue: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VulnerabilityAssessmentShouldBeEnabledForVMs - Effect'
          description: 'The effect of the Azure Policy VulnerabilityAssessmentShouldBeEnabledForVMs.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        value: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        value: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        value: 'AuditIfNotExists'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure machines to receive a vulnerability assessment provider'
        policyDefinitionId: '13ce0167-8ca6-4048-8e6b-f996402e3c1b'
        policyDefinitionReferenceId: 'ConfigureVulnerabilityAssessmentProviderForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_Effect\')]'
          }
          vaType: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType\')]'
          }
        }
      }
      {
        policyDisplayName: 'A vulnerability assessment solution should be enabled on your virtual machines'
        policyDefinitionId: '501541f7-f7e7-4cd6-868c-4190fdad3ac9'
        policyDefinitionReferenceId: 'VulnerabilityAssessmentShouldBeEnabledForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'VulnerabilityAssessmentShouldBeEnabledForVMs_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Network DMZ - Data Confidentiality - Classification 1
  {
    policySetName: 'pol-net-dmz-dataconf-1'
    description: 'Set of policies to enforce regarding networking from a data confidentiality perspective for information classification 1.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Network DMZ - Data Confidentiality - Classification 2
  {
    policySetName: 'pol-net-dmz-dataconf-2'
    description: 'Set of policies to enforce regarding networking from a data confidentiality perspective for information classification 2.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Network DMZ - Data Confidentiality - Classification 3
  {
    policySetName: 'pol-net-dmz-dataconf-3'
    description: 'Set of policies to enforce regarding networking from a data confidentiality perspective for information classification 3.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Assessment Provider Type'
          description: 'The vulnerability assessment solution to provision to the machines.'
        }
        allowedValues: [
          'default'
          'mdeTvm'
        ]
        defaultValue: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VulnerabilityAssessmentShouldBeEnabledForVMs - Effect'
          description: 'The effect of the Azure Policy VulnerabilityAssessmentShouldBeEnabledForVMs.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      EnforceSSLForPostgreSQL_Effect: {
        type: 'string'
        metadata: {
          displayName: 'EnforceSSLForPostgreSQL - Effect'
          description: 'The effect of the Azure Policy EnforceSSLForPostgreSQL.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      EnforceSSLForMySQL_Effect: {
        type: 'string'
        metadata: {
          displayName: 'EnforceSSLForMySQL - Effect'
          description: 'The effect of the Azure Policy EnforceSSLForMySQL.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        value: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        value: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        value: 'AuditIfNotExists'
      }
      EnforceSSLForPostgreSQL_Effect: {
        value: 'Audit'
      }
      EnforceSSLForMySQL_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure machines to receive a vulnerability assessment provider'
        policyDefinitionId: '13ce0167-8ca6-4048-8e6b-f996402e3c1b'
        policyDefinitionReferenceId: 'ConfigureVulnerabilityAssessmentProviderForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_Effect\')]'
          }
          vaType: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType\')]'
          }
        }
      }
      {
        policyDisplayName: 'A vulnerability assessment solution should be enabled on your virtual machines'
        policyDefinitionId: '501541f7-f7e7-4cd6-868c-4190fdad3ac9'
        policyDefinitionReferenceId: 'VulnerabilityAssessmentShouldBeEnabledForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'VulnerabilityAssessmentShouldBeEnabledForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Enforce SSL connection should be enabled for PostgreSQL database servers'
        policyDefinitionId: 'd158790f-bfb0-486c-8631-2dc6b4e8e6af'
        policyDefinitionReferenceId: 'EnforceSSLForPostgreSQL'
        parameters: {
          effect: {
            value: '[[parameters(\'EnforceSSLForPostgreSQL_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Enforce SSL connection should be enabled for MySQL database servers'
        policyDefinitionId: 'e802a67a-daf5-4436-9ea6-f6d821dd0c5d'
        policyDefinitionReferenceId: 'EnforceSSLForMySQL'
        parameters: {
          effect: {
            value: '[[parameters(\'EnforceSSLForMySQL_Effect\')]'
          }
        }
      }
    ]
  }
  // [Azure Policy Initiative] Network DMZ - Data Confidentiality - Classification 4
  {
    policySetName: 'pol-net-dmz-dataconf-4'
    description: 'Set of policies to enforce regarding networking from a data confidentiality perspective for information classification 4.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Assessment Provider Type'
          description: 'The vulnerability assessment solution to provision to the machines.'
        }
        allowedValues: [
          'default'
          'mdeTvm'
        ]
        defaultValue: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VulnerabilityAssessmentShouldBeEnabledForVMs - Effect'
          description: 'The effect of the Azure Policy VulnerabilityAssessmentShouldBeEnabledForVMs.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      EnforceSSLForPostgreSQL_Effect: {
        type: 'string'
        metadata: {
          displayName: 'EnforceSSLForPostgreSQL - Effect'
          description: 'The effect of the Azure Policy EnforceSSLForPostgreSQL.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      EnforceSSLForMySQL_Effect: {
        type: 'string'
        metadata: {
          displayName: 'EnforceSSLForMySQL - Effect'
          description: 'The effect of the Azure Policy EnforceSSLForMySQL.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        value: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        value: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        value: 'AuditIfNotExists'
      }
      EnforceSSLForPostgreSQL_Effect: {
        value: 'Audit'
      }
      EnforceSSLForMySQL_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure machines to receive a vulnerability assessment provider'
        policyDefinitionId: '13ce0167-8ca6-4048-8e6b-f996402e3c1b'
        policyDefinitionReferenceId: 'ConfigureVulnerabilityAssessmentProviderForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_Effect\')]'
          }
          vaType: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType\')]'
          }
        }
      }
      {
        policyDisplayName: 'A vulnerability assessment solution should be enabled on your virtual machines'
        policyDefinitionId: '501541f7-f7e7-4cd6-868c-4190fdad3ac9'
        policyDefinitionReferenceId: 'VulnerabilityAssessmentShouldBeEnabledForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'VulnerabilityAssessmentShouldBeEnabledForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Enforce SSL connection should be enabled for PostgreSQL database servers'
        policyDefinitionId: 'd158790f-bfb0-486c-8631-2dc6b4e8e6af'
        policyDefinitionReferenceId: 'EnforceSSLForPostgreSQL'
        parameters: {
          effect: {
            value: '[[parameters(\'EnforceSSLForPostgreSQL_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Enforce SSL connection should be enabled for MySQL database servers'
        policyDefinitionId: 'e802a67a-daf5-4436-9ea6-f6d821dd0c5d'
        policyDefinitionReferenceId: 'EnforceSSLForMySQL'
        parameters: {
          effect: {
            value: '[[parameters(\'EnforceSSLForMySQL_Effect\')]'
          }
        }
      }
    ]
  }
  // [Azure Policy Initiative] Network DMZ - Data Confidentiality - Classification 5
  {
    policySetName: 'pol-net-dmz-dataconf-5'
    description: 'Set of policies to enforce regarding networking from a data confidentiality perspective for information classification 5.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Virtual Machine Contributor'
        roleDefinitionId: '9980e02c-c2be-4d73-94e8-173b1dc7cf3c'
      }
      {
        roleDefinitionName: 'Azure Connected Machine Resource Administrator'
        roleDefinitionId: 'cd570a14-e51a-42ad-bac8-bafd67325302'
      }
      {
        roleDefinitionName: 'Security Admin'
        roleDefinitionId: 'fb1c8493-542b-48eb-b624-b4c8fea62acd'
      }
    ]
    parameterDefinitions: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldUseSpecifiedMode.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      AppGwWAFShouldUseSpecifiedMode_ModeRequirement: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldUseSpecifiedMode - Mode Requirement'
          description: 'Specifies whether the WAF is required to be set to Prevention or Detection.'
        }
        allowedValues: [
          'Prevention'
          'Detection'
        ]
        defaultValue: 'Prevention'
      }
      AppGwWAFShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppGwWAFShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy AppGwWAFShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        type: 'string'
        metadata: {
          displayName: 'InternetTrafficShouldBeRoutedViaAzFW - Effect'
          description: 'The effect of the Azure Policy InternetTrafficShouldBeRoutedViaAzFW.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SubnetShouldBeLinkedToNSG - Effect'
          description: 'The effect of the Azure Policy SubnetShouldBeLinkedToNSG.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareForWindowsServerShouldBeDeployed - Effect'
          description: 'The effect of the Azure Policy AntiMalwareForWindowsServerShouldBeDeployed.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AntiMalwareShouldAutoUpdateSignatures - Effect'
          description: 'The effect of the Azure Policy AntiMalwareShouldAutoUpdateSignatures.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'CloudServicesShouldHaveUpdatesInstalled - Effect'
          description: 'The effect of the Azure Policy CloudServicesShouldHaveUpdatesInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnVMsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnVMsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SystemUpdatesOnScaleSetsShouldBeInstalled - Effect'
          description: 'The effect of the Azure Policy SystemUpdatesOnScaleSetsShouldBeInstalled.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Assessment Mode'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'ImageDefault'
          'AutomaticByPlatform'
        ]
        defaultValue: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Os Type'
          description: 'The Os Type of the virtual machines that should be assessed.'
        }
        allowedValues: [
          'Windows'
          'Linux'
        ]
        defaultValue: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        type: 'array'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Locations'
          description: 'The location(s) of the virtual machines that should be assessed.'
        }
        defaultValue: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        type: 'object'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tags'
          description: 'The tags that should be matched for the VMs that should be checked for missing updates.'
        }
        defaultValue: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForAzureArcVMs - Tag Operator'
          description: 'The assessment mode for the virtual machines.'
        }
        allowedValues: [
          'All'
          'Any'
        ]
        defaultValue: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigurePeriodicUpdateChecksForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Effect'
          description: 'The effect of the Azure Policy ConfigureVulnerabilityAssessmentProviderForVMs.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        type: 'string'
        metadata: {
          displayName: 'ConfigureVulnerabilityAssessmentProviderForVMs - Assessment Provider Type'
          description: 'The vulnerability assessment solution to provision to the machines.'
        }
        allowedValues: [
          'default'
          'mdeTvm'
        ]
        defaultValue: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VulnerabilityAssessmentShouldBeEnabledForVMs - Effect'
          description: 'The effect of the Azure Policy VulnerabilityAssessmentShouldBeEnabledForVMs.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      EnforceSSLForPostgreSQL_Effect: {
        type: 'string'
        metadata: {
          displayName: 'EnforceSSLForPostgreSQL - Effect'
          description: 'The effect of the Azure Policy EnforceSSLForPostgreSQL.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      EnforceSSLForMySQL_Effect: {
        type: 'string'
        metadata: {
          displayName: 'EnforceSSLForMySQL - Effect'
          description: 'The effect of the Azure Policy EnforceSSLForMySQL.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      AppGwWAFShouldUseSpecifiedMode_Effect: {
        value: 'Deny'
      }
      AppGwWafShouldUseSpecifiedMode_ModeRequirement: {
        value: 'Prevention'
      }
      InternetTrafficShouldBeRoutedViaAzFW_Effect: {
        value: 'AuditIfNotExists'
      }
      SubnetShouldBeLinkedToNSG_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareForWindowsServerShouldBeDeployed_Effect: {
        value: 'AuditIfNotExists'
      }
      AntiMalwareShouldAutoUpdateSignatures_Effect: {
        value: 'AuditIfNotExists'
      }
      CloudServicesShouldHaveUpdatesInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnVMsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      SystemUpdatesOnScaleSetsShouldBeInstalled_Effect: {
        value: 'AuditIfNotExists'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator: {
        value: 'Any'
      }
      ConfigurePeriodicUpdateChecksForVMs_Effect: {
        value: 'Audit'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode: {
        value: 'ImageDefault'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType: {
        value: 'Windows'
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations: {
        value: []
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues: {
        value: {}
      }
      ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator: {
        value: 'Any'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_Effect: {
        value: 'DeployIfNotExists'
      }
      ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType: {
        value: 'default'
      }
      VulnerabilityAssessmentShouldBeEnabledForVMs_Effect: {
        value: 'AuditIfNotExists'
      }
      EnforceSSLForPostgreSQL_Effect: {
        value: 'Audit'
      }
      EnforceSSLForMySQL_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'Web Application Firewall (WAF) should use the specified mode for Application Gateway'
        policyDefinitionId: '12430be1-6cc8-4527-a9a8-e3d38f250096'
        policyDefinitionReferenceId: 'AppGwWAFShouldUseSpecifiedMode'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_Effect\')]'
          }
          modeRequirement: {
            value: '[[parameters(\'AppGwWAFShouldUseSpecifiedMode_ModeRequirement\')]'
          }
        }
      }
      {
        policyDisplayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
        policyDefinitionId: '564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
        policyDefinitionReferenceId: 'AppGwWAFShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'AppGwWAFShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: All Internet traffic should be routed via your deployed Azure Firewall'
        policyDefinitionId: 'fc5e4038-4584-4632-8c85-c0448d374b2c'
        policyDefinitionReferenceId: 'InternetTrafficShouldBeRoutedViaAzFW'
        parameters: {
          effect: {
            value: '[[parameters(\'InternetTrafficShouldBeRoutedViaAzFW_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Subnets should be associated with a Network Security Group'
        policyDefinitionId: 'e71308d3-144b-4262-b144-efdc3cc90517'
        policyDefinitionReferenceId: 'SubnetShouldBeLinkedToNSG'
        parameters: {
          effect: {
            value: '[[parameters(\'SubnetShouldBeLinkedToNSG_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy default Microsoft IaaSAntimalware extension for Windows Server'
        policyDefinitionId: '2835b622-407b-4114-9198-6f7064cbe0dc'
        policyDefinitionReferenceId: 'DeployAntiMalwareForWindowsServer'
      }
      {
        policyDisplayName: 'Microsoft IaaSAntimalware extension should be deployed on Windows servers'
        policyDefinitionId: '9b597639-28e4-48eb-b506-56b05d366257'
        policyDefinitionReferenceId: 'AntiMalwareForWindowsServerShouldBeDeployed'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareForWindowsServerShouldBeDeployed_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Microsoft Antimalware for Azure should be configured to automatically update protection signatures'
        policyDefinitionId: 'c43e4a30-77cb-48ab-a4dd-93f175c63b57'
        policyDefinitionReferenceId: 'AntiMalwareShouldAutoUpdateSignatures'
        parameters: {
          effect: {
            value: '[[parameters(\'AntiMalwareShouldAutoUpdateSignatures_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Cloud Services (extended support) role instances should have system updates installed'
        policyDefinitionId: '4df26ba8-026d-45b0-9521-bffa44d741d2'
        policyDefinitionReferenceId: 'CloudServicesShouldHaveUpdatesInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'CloudServicesShouldHaveUpdatesInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates should be installed on your machines'
        policyDefinitionId: '86b3d65f-7626-441e-b690-81a8b71cff60'
        policyDefinitionReferenceId: 'SystemUpdatesOnVMsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnVMsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'System updates on virtual machine scale sets should be installed'
        policyDefinitionId: 'c3f317a7-a95c-4547-b7e7-11017ebdf2fe'
        policyDefinitionReferenceId: 'SystemUpdatesOnScaleSetsShouldBeInstalled'
        parameters: {
          effect: {
            value: '[[parameters(\'SystemUpdatesOnScaleSetsShouldBeInstalled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure virtual machines'
        policyDefinitionId: '59efceea-0c96-497e-a4a1-4eb2290dac15'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Machines should be configured to periodically check for missing system updates'
        policyDefinitionId: 'bd876905-5b84-4f73-ab2d-2e7a7c4568d9'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure periodic checking for missing system updates on azure Arc-enabled servers'
        policyDefinitionId: 'bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        policyDefinitionReferenceId: 'ConfigurePeriodicUpdateChecksForAzureArcVMs'
        parameters: {
          assessmentMode: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_AssessmentMode\')]'
          }
          osType: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_OsType\')]'
          }
          locations: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_Locations\')]'
          }
          tagValues: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagValues\')]'
          }
          tagOperator: {
            value: '[[parameters(\'ConfigurePeriodicUpdateChecksForAzureArcVMs_TagOperator\')]'
          }
        }
      }
      {
        policyDisplayName: '[Preview]: Configure machines to receive a vulnerability assessment provider'
        policyDefinitionId: '13ce0167-8ca6-4048-8e6b-f996402e3c1b'
        policyDefinitionReferenceId: 'ConfigureVulnerabilityAssessmentProviderForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_Effect\')]'
          }
          vaType: {
            value: '[[parameters(\'ConfigureVulnerabilityAssessmentProviderForVMs_ProviderType\')]'
          }
        }
      }
      {
        policyDisplayName: 'A vulnerability assessment solution should be enabled on your virtual machines'
        policyDefinitionId: '501541f7-f7e7-4cd6-868c-4190fdad3ac9'
        policyDefinitionReferenceId: 'VulnerabilityAssessmentShouldBeEnabledForVMs'
        parameters: {
          effect: {
            value: '[[parameters(\'VulnerabilityAssessmentShouldBeEnabledForVMs_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Enforce SSL connection should be enabled for PostgreSQL database servers'
        policyDefinitionId: 'd158790f-bfb0-486c-8631-2dc6b4e8e6af'
        policyDefinitionReferenceId: 'EnforceSSLForPostgreSQL'
        parameters: {
          effect: {
            value: '[[parameters(\'EnforceSSLForPostgreSQL_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Enforce SSL connection should be enabled for MySQL database servers'
        policyDefinitionId: 'e802a67a-daf5-4436-9ea6-f6d821dd0c5d'
        policyDefinitionReferenceId: 'EnforceSSLForMySQL'
        parameters: {
          effect: {
            value: '[[parameters(\'EnforceSSLForMySQL_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Confidentiality - Classification 1
  {
    policySetName: 'pol-crypt-conf-1'
    description: 'Set of policies to enforce regarding cryptography from a confidentiality perspective for information classification 1.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'SQL DB Contributor'
        roleDefinitionId: '9b7fa17d-e63e-47b0-bb0a-15c516ac86ec'
      }
    ]
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Confidentiality - Classification 2
  {
    policySetName: 'pol-crypt-conf-2'
    description: 'Set of policies to enforce regarding cryptography from a confidentiality perspective for information classification 2.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'SQL DB Contributor'
        roleDefinitionId: '9b7fa17d-e63e-47b0-bb0a-15c516ac86ec'
      }
    ]
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Confidentiality - Classification 3
  {
    policySetName: 'pol-crypt-conf-3'
    description: 'Set of policies to enforce regarding cryptography from a confidentiality perspective for information classification 3.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'SQL DB Contributor'
        roleDefinitionId: '9b7fa17d-e63e-47b0-bb0a-15c516ac86ec'
      }
    ]
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VirtualMachinesShouldUseEncryptionAtHost_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VirtualMachinesShouldUseEncryptionAtHost - Effect'
          description: 'The effect of the Azure Policy VirtualMachinesShouldUseEncryptionAtHost.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      KubernetesVMsShouldUseCustomerManagedKeys_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KubernetesVMsShouldUseCustomerManagedKeys - Effect'
          description: 'The effect of the Azure Policy KubernetesVMsShouldUseCustomerManagedKeys.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VirtualMachinesShouldUseDataEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VirtualMachinesShouldUseDataEncryption - Effect'
          description: 'The effect of the Azure Policy VirtualMachinesShouldUseDataEncryption.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      PostgresSqlShouldUseInfrastructureEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'PostgresSqlShouldUseInfrastructureEncryption - Effect'
          description: 'The effect of the Azure Policy PostgresSqlShouldUseInfrastructureEncryption.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      MySqlShouldUseInfrastructureEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'MySqlShouldUseInfrastructureEncryption - Effect'
          description: 'The effect of the Azure Policy MySqlShouldUseInfrastructureEncryption.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VirtualMachinesShouldUseEncryptionAtHost_Effect: {
        value: 'Deny'
      }
      KubernetesVMsShouldUseCustomerManagedKeys_Effect: {
        value: 'Audit'
      }
      VirtualMachinesShouldUseDataEncryption_Effect: {
        value: 'AuditIfNotExists'
      }
      PostgresSqlShouldUseInfrastructureEncryption_Effect: {
        value: 'Deny'
      }
      MySqlShouldUseInfrastructureEncryption_Effect: {
        value: 'Deny'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Virtual machines and virtual machine scale sets should have encryption at host enabled'
        policyDefinitionId: 'fc4d8e41-e223-45ea-9bf5-eada37891d87'
        policyDefinitionReferenceId: 'VirtualMachinesShouldUseEncryptionAtHost'
        parameters: {
          effect: {
            value: '[[parameters(\'VirtualMachinesShouldUseEncryptionAtHost_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Both operating systems and data disks in Azure Kubernetes Service clusters should be encrypted by customer-managed keys'
        policyDefinitionId: '7d7be79c-23ba-4033-84dd-45e2a5ccdd67'
        policyDefinitionReferenceId: 'KubernetesVMsShouldUseCustomerManagedKeys'
        parameters: {
          effect: {
            value: '[[parameters(\'KubernetesVMsShouldUseCustomerManagedKeys_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources'
        policyDefinitionId: '0961003e-5a0a-4549-abde-af6a37f2724d'
        policyDefinitionReferenceId: 'VirtualMachinesShouldUseDataEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'VirtualMachinesShouldUseDataEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Infrastructure encryption should be enabled for Azure Database for PostgreSQL servers'
        policyDefinitionId: '24fba194-95d6-48c0-aea7-f65bf859c598'
        policyDefinitionReferenceId: 'PostgresSqlShouldUseInfrastructureEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'PostgresSqlShouldUseInfrastructureEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Infrastructure encryption should be enabled for Azure Database for MySQL servers'
        policyDefinitionId: '3a58212a-c829-4f13-9872-6371df2fd0b4'
        policyDefinitionReferenceId: 'MySqlShouldUseInfrastructureEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'MySqlShouldUseInfrastructureEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy SQL DB transparent data encryption'
        policyDefinitionId: '86a912f6-9a06-4e26-b447-11b16ba8659f'
        policyDefinitionReferenceId: 'DeploySqlDbTransparentDataEncryption'
        parameters: {} // Policy has no parameters
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Confidentiality - Classification 4
  {
    policySetName: 'pol-crypt-conf-4'
    description: 'Set of policies to enforce regarding cryptography from a confidentiality perspective for information classification 4.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'SQL DB Contributor'
        roleDefinitionId: '9b7fa17d-e63e-47b0-bb0a-15c516ac86ec'
      }
    ]
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VirtualMachinesShouldUseEncryptionAtHost_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VirtualMachinesShouldUseEncryptionAtHost - Effect'
          description: 'The effect of the Azure Policy VirtualMachinesShouldUseEncryptionAtHost.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      KubernetesVMsShouldUseCustomerManagedKeys_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KubernetesVMsShouldUseCustomerManagedKeys - Effect'
          description: 'The effect of the Azure Policy KubernetesVMsShouldUseCustomerManagedKeys.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VirtualMachinesShouldUseDataEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VirtualMachinesShouldUseDataEncryption - Effect'
          description: 'The effect of the Azure Policy VirtualMachinesShouldUseDataEncryption.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      PostgresSqlShouldUseInfrastructureEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'PostgresSqlShouldUseInfrastructureEncryption - Effect'
          description: 'The effect of the Azure Policy PostgresSqlShouldUseInfrastructureEncryption.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      MySqlShouldUseInfrastructureEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'MySqlShouldUseInfrastructureEncryption - Effect'
          description: 'The effect of the Azure Policy MySqlShouldUseInfrastructureEncryption.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VirtualMachinesShouldUseEncryptionAtHost_Effect: {
        value: 'Deny'
      }
      KubernetesVMsShouldUseCustomerManagedKeys_Effect: {
        value: 'Audit'
      }
      VirtualMachinesShouldUseDataEncryption_Effect: {
        value: 'AuditIfNotExists'
      }
      PostgresSqlShouldUseInfrastructureEncryption_Effect: {
        value: 'Deny'
      }
      MySqlShouldUseInfrastructureEncryption_Effect: {
        value: 'Deny'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Virtual machines and virtual machine scale sets should have encryption at host enabled'
        policyDefinitionId: 'fc4d8e41-e223-45ea-9bf5-eada37891d87'
        policyDefinitionReferenceId: 'VirtualMachinesShouldUseEncryptionAtHost'
        parameters: {
          effect: {
            value: '[[parameters(\'VirtualMachinesShouldUseEncryptionAtHost_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Both operating systems and data disks in Azure Kubernetes Service clusters should be encrypted by customer-managed keys'
        policyDefinitionId: '7d7be79c-23ba-4033-84dd-45e2a5ccdd67'
        policyDefinitionReferenceId: 'KubernetesVMsShouldUseCustomerManagedKeys'
        parameters: {
          effect: {
            value: '[[parameters(\'KubernetesVMsShouldUseCustomerManagedKeys_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources'
        policyDefinitionId: '0961003e-5a0a-4549-abde-af6a37f2724d'
        policyDefinitionReferenceId: 'VirtualMachinesShouldUseDataEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'VirtualMachinesShouldUseDataEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Infrastructure encryption should be enabled for Azure Database for PostgreSQL servers'
        policyDefinitionId: '24fba194-95d6-48c0-aea7-f65bf859c598'
        policyDefinitionReferenceId: 'PostgresSqlShouldUseInfrastructureEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'PostgresSqlShouldUseInfrastructureEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Infrastructure encryption should be enabled for Azure Database for MySQL servers'
        policyDefinitionId: '3a58212a-c829-4f13-9872-6371df2fd0b4'
        policyDefinitionReferenceId: 'MySqlShouldUseInfrastructureEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'MySqlShouldUseInfrastructureEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy SQL DB transparent data encryption'
        policyDefinitionId: '86a912f6-9a06-4e26-b447-11b16ba8659f'
        policyDefinitionReferenceId: 'DeploySqlDbTransparentDataEncryption'
        parameters: {} // Policy has no parameters
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Confidentiality - Classification 5
  {
    policySetName: 'pol-crypt-conf-5'
    description: 'Set of policies to enforce regarding cryptography from a confidentiality perspective for information classification 5.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'SQL DB Contributor'
        roleDefinitionId: '9b7fa17d-e63e-47b0-bb0a-15c516ac86ec'
      }
    ]
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VirtualMachinesShouldUseEncryptionAtHost_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VirtualMachinesShouldUseEncryptionAtHost - Effect'
          description: 'The effect of the Azure Policy VirtualMachinesShouldUseEncryptionAtHost.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      KubernetesVMsShouldUseCustomerManagedKeys_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KubernetesVMsShouldUseCustomerManagedKeys - Effect'
          description: 'The effect of the Azure Policy KubernetesVMsShouldUseCustomerManagedKeys.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VirtualMachinesShouldUseDataEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VirtualMachinesShouldUseDataEncryption - Effect'
          description: 'The effect of the Azure Policy VirtualMachinesShouldUseDataEncryption.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      PostgresSqlShouldUseInfrastructureEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'PostgresSqlShouldUseInfrastructureEncryption - Effect'
          description: 'The effect of the Azure Policy PostgresSqlShouldUseInfrastructureEncryption.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      MySqlShouldUseInfrastructureEncryption_Effect: {
        type: 'string'
        metadata: {
          displayName: 'MySqlShouldUseInfrastructureEncryption - Effect'
          description: 'The effect of the Azure Policy MySqlShouldUseInfrastructureEncryption.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VirtualMachinesShouldUseEncryptionAtHost_Effect: {
        value: 'Deny'
      }
      KubernetesVMsShouldUseCustomerManagedKeys_Effect: {
        value: 'Audit'
      }
      VirtualMachinesShouldUseDataEncryption_Effect: {
        value: 'AuditIfNotExists'
      }
      PostgresSqlShouldUseInfrastructureEncryption_Effect: {
        value: 'Deny'
      }
      MySqlShouldUseInfrastructureEncryption_Effect: {
        value: 'Deny'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Virtual machines and virtual machine scale sets should have encryption at host enabled'
        policyDefinitionId: 'fc4d8e41-e223-45ea-9bf5-eada37891d87'
        policyDefinitionReferenceId: 'VirtualMachinesShouldUseEncryptionAtHost'
        parameters: {
          effect: {
            value: '[[parameters(\'VirtualMachinesShouldUseEncryptionAtHost_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Both operating systems and data disks in Azure Kubernetes Service clusters should be encrypted by customer-managed keys'
        policyDefinitionId: '7d7be79c-23ba-4033-84dd-45e2a5ccdd67'
        policyDefinitionReferenceId: 'KubernetesVMsShouldUseCustomerManagedKeys'
        parameters: {
          effect: {
            value: '[[parameters(\'KubernetesVMsShouldUseCustomerManagedKeys_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources'
        policyDefinitionId: '0961003e-5a0a-4549-abde-af6a37f2724d'
        policyDefinitionReferenceId: 'VirtualMachinesShouldUseDataEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'VirtualMachinesShouldUseDataEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Infrastructure encryption should be enabled for Azure Database for PostgreSQL servers'
        policyDefinitionId: '24fba194-95d6-48c0-aea7-f65bf859c598'
        policyDefinitionReferenceId: 'PostgresSqlShouldUseInfrastructureEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'PostgresSqlShouldUseInfrastructureEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Infrastructure encryption should be enabled for Azure Database for MySQL servers'
        policyDefinitionId: '3a58212a-c829-4f13-9872-6371df2fd0b4'
        policyDefinitionReferenceId: 'MySqlShouldUseInfrastructureEncryption'
        parameters: {
          effect: {
            value: '[[parameters(\'MySqlShouldUseInfrastructureEncryption_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy SQL DB transparent data encryption'
        policyDefinitionId: '86a912f6-9a06-4e26-b447-11b16ba8659f'
        policyDefinitionReferenceId: 'DeploySqlDbTransparentDataEncryption'
        parameters: {} // Policy has no parameters
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Confidentiality - Classification 1
  {
    policySetName: 'pol-crypt-conf-gdpr-1'
    description: 'Set of policies to enforce regarding cryptography from a GDPR confidentiality perspective for information classification 1.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Confidentiality - Classification 2
  {
    policySetName: 'pol-crypt-conf-gdpr-2'
    description: 'Set of policies to enforce regarding cryptography from a GDPR confidentiality perspective for information classification 2.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Confidentiality - Classification 3
  {
    policySetName: 'pol-crypt-conf-gdpr-3'
    description: 'Set of policies to enforce regarding cryptography from a GDPR confidentiality perspective for information classification 3.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Confidentiality - Classification 4
  {
    policySetName: 'pol-crypt-conf-gdpr-4'
    description: 'Set of policies to enforce regarding cryptography from a GDPR confidentiality perspective for information classification 4.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Confidentiality - Classification 5
  {
    policySetName: 'pol-crypt-conf-gdpr-5'
    description: 'Set of policies to enforce regarding cryptography from a GDPR confidentiality perspective for information classification 5.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Integrity - Classification 1
  {
    policySetName: 'pol-crypt-integr-1'
    description: 'Set of policies to enforce regarding cryptography from an integrity perspective for information classification 1.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Integrity - Classification 2
  {
    policySetName: 'pol-crypt-integr-2'
    description: 'Set of policies to enforce regarding cryptography from an integrity perspective for information classification 2.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Integrity - Classification 3
  {
    policySetName: 'pol-crypt-integr-3'
    description: 'Set of policies to enforce regarding cryptography from an integrity perspective for information classification 3.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Integrity - Classification 4
  {
    policySetName: 'pol-crypt-integr-4'
    description: 'Set of policies to enforce regarding cryptography from an integrity perspective for information classification 4.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - Integrity - Classification 5
  {
    policySetName: 'pol-crypt-integr-5'
    description: 'Set of policies to enforce regarding cryptography from an integrity perspective for information classification 5.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Integrity - Classification 1
  {
    policySetName: 'pol-crypt-integr-gdpr-1'
    description: 'Set of policies to enforce regarding cryptography from a GDPR integrity perspective for information classification 1.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Integrity - Classification 2
  {
    policySetName: 'pol-crypt-integr-gdpr-2'
    description: 'Set of policies to enforce regarding cryptography from a GDPR integrity perspective for information classification 2.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Integrity - Classification 3
  {
    policySetName: 'pol-crypt-integr-gdpr-3'
    description: 'Set of policies to enforce regarding cryptography from a GDPR integrity perspective for information classification 3.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Integrity - Classification 4
  {
    policySetName: 'pol-crypt-integr-gdpr-4'
    description: 'Set of policies to enforce regarding cryptography from a GDPR integrity perspective for information classification 4.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Cryptography - GDPR Integrity - Classification 5
  {
    policySetName: 'pol-crypt-integr-gdpr-5'
    description: 'Set of policies to enforce regarding cryptography from a GDPR integrity perspective for information classification 5.'
    parameterDefinitions: {
      ASEShouldUseStrongestCiphers_Effect: {
        type: 'string'
        metadata: {
          displayName: 'ASEShouldUseStrongestCiphers - Effect'
          description: 'The effect of the Azure Policy ASEShouldUseStrongestCiphers.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInApiApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInApiApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AppServiceEnvironmentShouldDisableOldTlsVersions - Effect'
          description: 'The effect of the Azure Policy AppServiceEnvironmentShouldDisableOldTlsVersions.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInWebApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInWebApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        type: 'string'
        metadata: {
          displayName: 'UseLatestTLSVersionInFunctionApp - Effect'
          description: 'The effect of the Azure Policy UseLatestTLSVersionInFunctionApp.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureAdDsShouldUseTls1_2Only - Effect'
          description: 'The effect of the Azure Policy AzureAdDsShouldUseTls1_2Only.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Effect'
          description: 'The effect of the Azure Policy WindowsWebServersShouldUseSecureCommunications.'
        }
        allowedValues: [
          'AuditIfNotExists'
          'Disabled'
        ]
        defaultValue: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Include Arc Machines'
          description: 'Specifies whether or not Azure ARC connected machines will be included in this policy. This incurs a monthly charge on your Azure subscription per Azure ARC connected machine.'
        }
        allowedValues: [
          'true'
          'false'
        ]
        defaultValue: 'false'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        type: 'string'
        metadata: {
          displayName: 'WindowsWebServersShouldUseSecureCommunications - Minimum TLS Version'
          description: 'Specifies the minimum TLS protocol version that should be enabled for the Windows web servers.'
        }
        allowedValues: [
          '1.1'
          '1.2'
        ]
        defaultValue: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'AzureSQLShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        type: 'string'
        metadata: {
          displayName: 'SqlManagedInstanceShouldUseTls1_2 - Effect'
          description: 'The effect of the Azure Policy AzureSQLShouldUseTls1_2.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        type: 'string'
        metadata: {
          displayName: 'VPNGatewaysShouldNotUseBasicSKU - Effect'
          description: 'The effect of the Azure Policy VPNGatewaysShouldNotUseBasicSKU.'
        }
        allowedValues: [
          'Audit'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
    }
    parameterValues: {
      ASEShouldUseStrongestCiphers_Effect: {
        value: 'Audit'
      }
      UseLatestTLSVersionInApiApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AppServiceEnvironmentShouldDisableOldTlsVersions_Effect: {
        value: 'Deny'
      }
      UseLatestTLSVersionInWebApp_Effect: {
        value: 'AuditIfNotExists'
      }
      UseLatestTLSVersionInFunctionApp_Effect: {
        value: 'AuditIfNotExists'
      }
      AzureAdDsShouldUseTls1_2Only_Effect: {
        value: 'Deny'
      }
      WindowsWebServersShouldUseSecureCommunications_Effect: {
        value: 'AuditIfNotExists'
      }
      WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines: {
        value: 'true'
      }
      WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion: {
        value: '1.2'
      }
      AzureSQLShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      SqlManagedInstanceShouldUseTls1_2_Effect: {
        value: 'Audit'
      }
      VPNGatewaysShouldNotUseBasicSKU_Effect: {
        value: 'Audit'
      }
    }
    policies: [
      {
        policyDisplayName: 'App Service Environment should be configured with strongest TLS Cipher suites'
        policyDefinitionId: '817dcf37-e83d-4999-a472-644eada2ea1e'
        policyDefinitionReferenceId: 'ASEShouldUseStrongestCiphers'
        parameters: {
          effect: {
            value: '[[parameters(\'ASEShouldUseStrongestCiphers_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your API App'
        policyDefinitionId: '8cb6aa8b-9e41-4f4e-aa25-089a7ac2581e'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInApiApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInApiApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'App Service Environment should disable TLS 1.0 and 1.1'
        policyDefinitionId: 'd6545c6b-dd9d-4265-91e6-0b451e2f1c50'
        policyDefinitionReferenceId: 'AppServiceEnvironmentShouldDisableOldTlsVersions'
        parameters: {
          effect: {
            value: '[[parameters(\'AppServiceEnvironmentShouldDisableOldTlsVersions_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Web App'
        policyDefinitionId: 'f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInWebApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInWebApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Latest TLS version should be used in your Function App'
        policyDefinitionId: 'f9d614c5-c173-4d56-95a7-b4437057d193'
        policyDefinitionReferenceId: 'UseLatestTLSVersionInFunctionApp'
        parameters: {
          effect: {
            value: '[[parameters(\'UseLatestTLSVersionInFunctionApp_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Active Directory Domain Services managed domains should use TLS 1.2 only mode'
        policyDefinitionId: '3aa87b5a-7813-4b57-8a43-42dd9df5aaa7'
        policyDefinitionReferenceId: 'AzureAdDsShouldUseTls1_2Only'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureAdDsShouldUseTls1_2Only_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Windows web servers should be configured to use secure communication protocols'
        policyDefinitionId: '5752e6d6-1206-46d8-8ab1-ecc2f71a8112'
        policyDefinitionReferenceId: 'WindowsWebServersShouldUseSecureCommunications'
        parameters: {
          effect: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_Effect\')]'
          }
          IncludeArcMachines: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_IncludeArcMachines\')]'
          }
          MinimumTLSVersion: {
            value: '[[parameters(\'WindowsWebServersShouldUseSecureCommunications_MinimumTLSVersion\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure SQL Database should have the minimal TLS version of 1.2'
        policyDefinitionId: '32e6bbec-16b6-44c2-be37-c5b672d103cf'
        policyDefinitionReferenceId: 'AzureSQLShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'AzureSQLShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'SQL Managed Instance should have the minimal TLS version of 1.2'
        policyDefinitionId: 'a8793640-60f7-487c-b5c3-1d37215905c4'
        policyDefinitionReferenceId: 'SqlManagedInstanceShouldUseTls1_2'
        parameters: {
          effect: {
            value: '[[parameters(\'SqlManagedInstanceShouldUseTls1_2_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure VPN gateways should not use \'basic\' SKU'
        policyDefinitionId: 'e345b6c3-24bd-4c93-9bbb-7e5e49a17b78'
        policyDefinitionReferenceId: 'VPNGatewaysShouldNotUseBasicSKU'
        parameters: {
          effect: {
            value: '[[parameters(\'VPNGatewaysShouldNotUseBasicSKU_Effect\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Confidentiality - Classification 1
  {
    policySetName: 'pol-keymgmt-conf-1'
    description: 'Set of policies to enforce regarding key management from a confidentiality perspective for information classification 1.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Confidentiality - Classification 2
  {
    policySetName: 'pol-keymgmt-conf-2'
    description: 'Set of policies to enforce regarding key management from a confidentiality perspective for information classification 2.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Confidentiality - Classification 3
  {
    policySetName: 'pol-keymgmt-conf-3'
    description: 'Set of policies to enforce regarding key management from a confidentiality perspective for information classification 3.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Confidentiality - Classification 4
  {
    policySetName: 'pol-keymgmt-conf-4'
    description: 'Set of policies to enforce regarding key management from a confidentiality perspective for information classification 4.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Confidentiality - Classification 5
  {
    policySetName: 'pol-keymgmt-conf-5'
    description: 'Set of policies to enforce regarding key management from a confidentiality perspective for information classification 5.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Key Vault Managed HSM should have purge protection enabled'
        policyDefinitionId: 'c39ba22d-4428-4149-b981-70acb31fc383'
        policyDefinitionReferenceId: 'PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Integrity - Classification 1
  {
    policySetName: 'pol-keymgmt-integr-1'
    description: 'Set of policies to enforce regarding key management from an integrity perspective for information classification 1.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Integrity - Classification 2
  {
    policySetName: 'pol-keymgmt-integr-2'
    description: 'Set of policies to enforce regarding key management from an integrity perspective for information classification 2.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Integrity - Classification 3
  {
    policySetName: 'pol-keymgmt-integr-3'
    description: 'Set of policies to enforce regarding key management from an integrity perspective for information classification 3.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Integrity - Classification 4
  {
    policySetName: 'pol-keymgmt-integr-4'
    description: 'Set of policies to enforce regarding key management from an integrity perspective for information classification 4.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }

  // [Azure Policy Initiative] Key Management - Integrity - Classification 5
  {
    policySetName: 'pol-keymgmt-integr-5'
    description: 'Set of policies to enforce regarding key management from an integrity perspective for information classification 5.'
    policyAssignmentRequiresIdentity: true
    roleAssignmentObjectList: [
      {
        roleDefinitionName: 'Monitoring Contributor'
        roleDefinitionId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
      }
      {
        roleDefinitionName: 'Log Analytics Contributor'
        roleDefinitionId: '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
      }
      {
        roleDefinitionName: 'Contributor'
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
      }
    ]
    parameterDefinitions: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultShouldHaveSoftDeleteEnabled - Effect'
          description: 'The effect of the Azure Policy KeyVaultShouldHaveSoftDeleteEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled_Effect: {
        type: 'string'
        metadata: {
          displayName: 'PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled - Effect'
          description: 'The effect of the Azure Policy PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled.'
        }
        allowedValues: [
          'Audit'
          'Deny'
          'Disabled'
        ]
        defaultValue: 'Audit'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Effect'
          description: 'The effect of the Azure Policy KeyVaultDiagnosticsToLogAnalytics.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Diagnostics Setting Name'
          description: 'The name that will be used to configure the  diagnostics settings.'
        }
        defaultValue: 'AzureKeyVaultDiagnosticsLogsToWorkspace'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Log Analytics Workspace Resource Id'
          description: 'The resource id of the Log Analytics workspace that the Key Vault diagnostics will be sent to.'
          strongType: 'omsWorkspace'
        }
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable Audit Event'
          description: 'Specifies whether or not Audit Events will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToLogAnalytics - Enable All Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Log Analytics workspace'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Effect'
          description: 'The effect of the Azure Policy KeyVaultHSMDiagnosticsToEventHub.'
        }
        allowedValues: [
          'DeployIfNotExists'
          'Disabled'
        ]
        defaultValue: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics settings.'
        }
        defaultValue: 'KeyVaultHSMDiagnosticsToEventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id.'
          strongType: 'Microsoft.EventHub/Namespaces/AuthorizationRules'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultHSMDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Diagnostics Setting Name'
          description: 'The name that will be used to configure the diagnostics setting to the Event Hub.'
        }
        defaultValue: 'KeyVaultDiagnosticsToEventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Authorization Rule Id'
          description: 'The Event Hub Authorization Rule Id'
        }
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Event Hub Location'
          description: 'The location of the Event Hub.'
          strongType: 'location'
        }
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Metrics'
          description: 'Specifies whether or not Metrics will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        type: 'string'
        metadata: {
          displayName: 'KeyVaultDiagnosticsToEventHub - Enable Logs'
          description: 'Specifies whether or not Logs will be sent to the Event Hub.'
        }
        allowedValues: [
          'True'
          'False'
        ]
        defaultValue: 'True'
      }
    }
    parameterValues: {
      KeyVaultShouldHaveSoftDeleteEnabled_Effect: {
        value: 'Deny'
      }
      PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled_Effect: {
        value: 'Deny'
      }
      KeyVaultDiagnosticsToLogAnalytics_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName: {
        value: 'KeyVault-To-LogAnalytics'
      }
      KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId: {
        value: LogAnalyticsWorkspaceResourceId
      }
      KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_Effect: {
        value: 'DeployIfNotExists'
      }
      KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVaultHSM-To-EventHub'
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultHSMDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultHSMDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName: {
        value: 'KeyVault-To-EventHub'
      }
      KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId: {
        value: EventHubAuthorizationRuleId
      }
      KeyVaultDiagnosticsToEventHub_EventHubLocation: {
        value: EventHubLocation
      }
      KeyVaultDiagnosticsToEventHub_MetricsEnabled: {
        value: 'True'
      }
      KeyVaultDiagnosticsToEventHub_LogsEnabled: {
        value: 'True'
      }
    }
    policies: [
      {
        policyDisplayName: 'Key vaults should have soft delete enabled'
        policyDefinitionId: '1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        policyDefinitionReferenceId: 'KeyVaultShouldHaveSoftDeleteEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultShouldHaveSoftDeleteEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Azure Key Vault Managed HSM should have purge protection enabled'
        policyDefinitionId: 'c39ba22d-4428-4149-b981-70acb31fc383'
        policyDefinitionReferenceId: 'PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled'
        parameters: {
          effect: {
            value: '[[parameters(\'PurgeProtectionForKeyVaultManagedHSMShouldBeEnabled_Effect\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings for Azure Key Vault to Log Analytics workspace'
        policyDefinitionId: '951af2fa-529b-416e-ab6e-066fd85ac459'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToLogAnalytics'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_Effect\')]'
          }
          diagnosticsSettingNameToUse: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_DiagnosticsSettingName\')]'
          }
          logAnalytics: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_LogAnalyticsWorkspaceResourceId\')]'
          }
          AuditEventEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AuditEventEnabled\')]'
          }
          AllMetricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToLogAnalytics_AllMetricsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy - Configure diagnostic settings to an Event Hub to be enabled on Azure Key Vault Managed HSM'
        policyDefinitionId: 'a6d2c800-5230-4a40-bff3-8268b4987d42'
        policyDefinitionReferenceId: 'KeyVaultHSMDiagnosticsToEventHub'
        parameters: {
          effect: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_Effect\')]'
          }
          profileName: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultHSMDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
      {
        policyDisplayName: 'Deploy Diagnostic Settings for Key Vault to Event Hub'
        policyDefinitionId: 'ed7c8c13-51e7-49d1-8a43-8490431a0da2'
        policyDefinitionReferenceId: 'KeyVaultDiagnosticsToEventHub'
        parameters: {
          profileName: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_DiagnosticsSettingName\')]'
          }
          eventHubRuleId: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubAuthorizationRuleId\')]'
          }
          eventHubLocation: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_EventHubLocation\')]'
          }
          metricsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_MetricsEnabled\')]'
          }
          logsEnabled: {
            value: '[[parameters(\'KeyVaultDiagnosticsToEventHub_LogsEnabled\')]'
          }
        }
      }
    ]
  }
]
// End of variables

// Start of modules
@batchSize(4)
@description('Deploys the list of defined policy sets at the management group scope.')
module policySetDefinition_managementGroup 'modules/resources/policySetDefinition_managementGroup.bicep' = [for policySetDefinitionObject in policySetDefinitionObjectList: if (contains(IncludedClassificationSets, policySetDefinitionObject.policySetName)) {
  name: 'PolIniDef-${policySetDefinitionObject.policySetName}'
  params: {
    policySetDefinitionName: policySetDefinitionObject.policySetName
    policyDefinitionObjectList: policySetDefinitionObject.policies
    policySetDefinitionParameters: policySetDefinitionObject.parameterDefinitions
  }
}]

@batchSize(4)
@description('Assigns the list of defined policy sets at the subscription scope.')
module policyAssignment_managementGroup 'modules/resources/policyAssignment_managementGroup.bicep' = [for policySetDefinitionObject in policySetDefinitionObjectList: if (contains(IncludedClassificationSets, policySetDefinitionObject.policySetName)) {
  name: 'PolAssign-${policySetDefinitionObject.policySetName}'
  dependsOn: policySetDefinition_managementGroup
  params: {
    policyAssignmentRequiresIdentity: contains(policySetDefinitionObject, 'policyAssignmentRequiresIdentity') && policySetDefinitionObject.policyAssignmentRequiresIdentity
    policyDefinitionId: extensionResourceId(managementGroup().id, 'Microsoft.Authorization/policySetDefinitions', policySetDefinitionObject.policySetName)
    policyAssignmentManagedIdentityLocation: ManagedIdentityLocation
    policyAssignmentName: policySetDefinitionObject.policySetName
    nonComplianceMessages: [for policy in policySetDefinitionObject.policies: {
      message: 'Resource creation/update was denied due to a violation of policy definition [${policy.policyDisplayName}] with id [${policy.policyDefinitionId}]. This definition belongs to the policy initiative [${extensionResourceId(managementGroup().id, 'Microsoft.Authorization/policySetDefinitions', policySetDefinitionObject.policySetName)}].'
      policyDefinitionReferenceId: contains(policy, 'policyDefinitionReferenceId') ? policy.policyDefinitionReferenceId : null
    }]
    parameters: policySetDefinitionObject.parameterValues
  }
}]

@batchSize(2) // Workaround for delay in policies being avaiable in the Azure backend
@description('Performs the role assignment for the DeployIfNotExists policies that require a system-assigned managed identity. The role assignment will be created at the subscription scope.')
module roleAssignment_managementGroup 'modules/resources/roleAssignment_managementGroup.bicep' = [for policySetDefinitionObject in policySetDefinitionObjectList: if (contains(policySetDefinitionObject, 'policyAssignmentRequiresIdentity') && policySetDefinitionObject.policyAssignmentRequiresIdentity && contains(policySetDefinitionObject, 'roleAssignmentObjectList') && !empty(policySetDefinitionObject.roleAssignmentObjectList)) {
  name: 'Rbac-${policySetDefinitionObject.policySetName}'
  dependsOn: policyAssignment_managementGroup
  params: {
    policySetAssignmentName: policySetDefinitionObject.policySetName
    roleAssignmentObjectList: policySetDefinitionObject.roleAssignmentObjectList
  }
}]
// End of modules

// Start of outputs
output policySetDefinitionObjectList array = [for (policySetDefinitionObject, index) in policySetDefinitionObjectList: {
  name: policySetDefinition_managementGroup[index].outputs.policySetDefinitionObject.name
  policySetDefinitionObject: policySetDefinition_managementGroup[index].outputs.policySetDefinitionObject
  policyAssignmentObject: policyAssignment_managementGroup[index].outputs.policyAssignmentObject
  roleAssignmentObjectList: contains(policySetDefinitionObject, 'policyAssignmentRequiresIdentity') && policySetDefinitionObject.policyAssignmentRequiresIdentity && contains(policySetDefinitionObject, 'roleAssignmentObjectList') && !empty(policySetDefinitionObject.roleAssignmentObjectList) ? roleAssignment_managementGroup[index].outputs.roleAssignmentObjectList : []
}]
// End of outputs
