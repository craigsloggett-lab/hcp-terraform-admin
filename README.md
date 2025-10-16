# terraform-root-module-template
A GitHub repository template for creating new Terraform root module.

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
| [tfe_project.data_engineering](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project) | resource |
| [tfe_project.data_platform](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project) | resource |
| [tfe_project.modules](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/project) | resource |
| [tfe_registry_provider.hashicorp](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/registry_provider) | resource |
| [tfe_registry_provider.microsoft](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/registry_provider) | resource |
| [tfe_team.data_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team) | resource |
| [tfe_team.data_platform_admins](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team) | resource |
| [tfe_team_project_access.data_engineering_data_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.data_engineering_data_platform_admins](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.data_platform_data_platform_admins](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.modules_data_engineers](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.modules_data_platform_admins](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/team_project_access) | resource |
| [tfe_variable_set.azurerm_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable_set) | resource |
| [tfe_variable_set.fabric_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/resources/variable_set) | resource |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.70.0/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_provider_authentication_variable_set_name"></a> [azurerm\_provider\_authentication\_variable\_set\_name](#input\_azurerm\_provider\_authentication\_variable\_set\_name) | The name of the variable set used to authenticate the Azure Provider. | `string` | `"Azure Provider Authentication"` | no |
| <a name="input_fabric_provider_authentication_variable_set_name"></a> [fabric\_provider\_authentication\_variable\_set\_name](#input\_fabric\_provider\_authentication\_variable\_set\_name) | The name of the variable set used to authenticate the Fabric Provider. | `string` | `"Microsoft Fabric Provider Authentication"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->