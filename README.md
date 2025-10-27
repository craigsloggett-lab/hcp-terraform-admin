# hcp-terraform-admin

An infrastructure as code repository to manage the craigsloggett-lab HCP Terraform organization.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_no_code_module.terraform_fabric_data_engineering_onboarding](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/no_code_module) | resource |
| [tfe_policy_set.global](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/policy_set) | resource |
| [tfe_project.data_engineering](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project) | resource |
| [tfe_project.data_platform](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project) | resource |
| [tfe_project.modules](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project) | resource |
| [tfe_project_variable_set.data_engineering_azurerm_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.data_engineering_fabric_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.data_engineering_github_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.data_engineering_tfe_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.data_platform_azurerm_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.data_platform_fabric_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.modules_azurerm_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.modules_fabric_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.modules_tfe_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project_variable_set) | resource |
| [tfe_registry_module.terraform_fabric_data_engineering_onboarding](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/registry_module) | resource |
| [tfe_registry_provider.hashicorp](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/registry_provider) | resource |
| [tfe_registry_provider.microsoft](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/registry_provider) | resource |
| [tfe_team.data_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team) | resource |
| [tfe_team.data_platform_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team) | resource |
| [tfe_team_project_access.data_engineering_data_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.data_engineering_data_platform_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.data_platform_data_platform_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.modules_data_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.modules_data_platform_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_client_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_client_secret](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_subscription_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_tenant_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_fabric_provider_authentication_fabric_client_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_fabric_provider_authentication_fabric_client_secret](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_fabric_provider_authentication_fabric_tenant_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_test_variable.terraform_fabric_data_engineering_onboarding_tfe_provider_authentication_tfe_token](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/test_variable) | resource |
| [tfe_variable.azurerm_provider_authentication_arm_client_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.azurerm_provider_authentication_arm_client_secret](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.azurerm_provider_authentication_arm_subscription_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.azurerm_provider_authentication_arm_tenant_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.data_platform_shared_services_github_personal_access_token](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.fabric_provider_authentication_fabric_client_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.fabric_provider_authentication_fabric_client_secret](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.fabric_provider_authentication_fabric_tenant_id](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable.github_provider_authentication_github_token](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable) | resource |
| [tfe_variable_set.azurerm_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable_set) | resource |
| [tfe_variable_set.fabric_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable_set) | resource |
| [tfe_variable_set.github_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable_set) | resource |
| [tfe_workspace.data_platform_shared_services](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/workspace) | resource |
| [tfe_workspace_settings.data_platform_shared_services](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/workspace_settings) | resource |
| [tfe_oauth_client.github](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/data-sources/oauth_client) | data source |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/data-sources/organization) | data source |
| [tfe_variable_set.tfe_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/data-sources/variable_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_provider_authentication_variable_set_name"></a> [azurerm\_provider\_authentication\_variable\_set\_name](#input\_azurerm\_provider\_authentication\_variable\_set\_name) | The name of the variable set used to authenticate the Azure Provider. | `string` | `"Azure Provider Authentication"` | no |
| <a name="input_azurerm_provider_subscription_id"></a> [azurerm\_provider\_subscription\_id](#input\_azurerm\_provider\_subscription\_id) | The ID of the Azure subscription used to configure the AzureRM provider. | `string` | `"8e880cb2-5dd1-40c4-9d22-a2dc8c7ddafe"` | no |
| <a name="input_data_platform_shared_services_workspace_name"></a> [data\_platform\_shared\_services\_workspace\_name](#input\_data\_platform\_shared\_services\_workspace\_name) | The name of the workspace managing the Data Platform's shared services. | `string` | `"azure-fabric-shared-services"` | no |
| <a name="input_fabric_provider_authentication_variable_set_name"></a> [fabric\_provider\_authentication\_variable\_set\_name](#input\_fabric\_provider\_authentication\_variable\_set\_name) | The name of the variable set used to authenticate the Fabric Provider. | `string` | `"Microsoft Fabric Provider Authentication"` | no |
| <a name="input_github_organization_name"></a> [github\_organization\_name](#input\_github\_organization\_name) | The name of the GitHub organization used to configure the VCS provider. | `string` | `"craigsloggett-lab"` | no |
| <a name="input_github_provider_authentication_variable_set_name"></a> [github\_provider\_authentication\_variable\_set\_name](#input\_github\_provider\_authentication\_variable\_set\_name) | The name of the variable set used to authenticate the GitHub Provider. | `string` | `"GitHub Provider Authentication"` | no |
| <a name="input_hcp_terraform_organization_name"></a> [hcp\_terraform\_organization\_name](#input\_hcp\_terraform\_organization\_name) | The name of the HCP Terraform organization being managed. | `string` | `"craigsloggett-lab"` | no |
| <a name="input_sentinel_policy_sets_repository_name"></a> [sentinel\_policy\_sets\_repository\_name](#input\_sentinel\_policy\_sets\_repository\_name) | The name of the GitHub repository hosting the Sentinel policy sets. | `string` | `"hcp-terraform-sentinel-policy"` | no |
| <a name="input_terraform_fabric_data_engineering_onboarding_module_version"></a> [terraform\_fabric\_data\_engineering\_onboarding\_module\_version](#input\_terraform\_fabric\_data\_engineering\_onboarding\_module\_version) | The Terraform module version to pin the data-engineering-onboarding no-code module to. | `string` | `"0.3.3"` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use in all workspaces. | `string` | `"1.13.3"` | no |
| <a name="input_tfe_provider_authentication_variable_set_name"></a> [tfe\_provider\_authentication\_variable\_set\_name](#input\_tfe\_provider\_authentication\_variable\_set\_name) | The name of the variable set used to authenticate the TFE Provider. | `string` | `"TFE Provider Authentication"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
