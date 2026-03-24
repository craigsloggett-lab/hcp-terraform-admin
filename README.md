# HCP Terraform Admin

An infrastructure as code repository to manage the `craigsloggett-lab` HCP Terraform organization.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.74.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.74.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_discovery"></a> [discovery](#module\_discovery) | craigsloggett/discovery/tfe | 0.14.4 |

## Resources

| Name | Type |
|------|------|
| [tfe_oauth_client.github](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/oauth_client) | resource |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/organization) | resource |
| [tfe_organization_membership.this](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/organization_membership) | resource |
| [tfe_project.admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project) | resource |
| [tfe_project.default](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project) | resource |
| [tfe_project.infrastructure](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project) | resource |
| [tfe_project.modules](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project) | resource |
| [tfe_project.stacks](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project) | resource |
| [tfe_project.waypoint](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project) | resource |
| [tfe_project.workloads](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project) | resource |
| [tfe_project_variable_set.aws_provider_authentication_dev_infrastructure](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project_variable_set) | resource |
| [tfe_project_variable_set.aws_provider_authentication_dev_waypoint](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/project_variable_set) | resource |
| [tfe_registry_provider.hashicorp](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/registry_provider) | resource |
| [tfe_team.admins](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team) | resource |
| [tfe_team.owners](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team) | resource |
| [tfe_team_organization_members.admins](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team_organization_members) | resource |
| [tfe_team_organization_members.owners](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team_organization_members) | resource |
| [tfe_team_project_access.admins_administration](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.admins_default_project](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.admins_infrastructure](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.admins_waypoint](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.admins_workloads](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/team_project_access) | resource |
| [tfe_variable.aws_access_key_id](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.aws_secret_access_key](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.aws_session_expiration](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.aws_session_token](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.github_owner](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.github_token](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.github_vcs_provider_oauth_token](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_ec2_ami_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_ec2_ami_owner](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_ec2_key_pair_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_pingfederate_allowed_cidrs](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_pingfederate_license_path](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_pingfederate_zip_path](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_project_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_route53_zone_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.pingfederate_deploy_vpc_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.tfe_token](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_ec2_ami_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_ec2_ami_owner](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_ec2_key_pair_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_nlb_internal](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_project_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_route53_zone_name](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_vault_api_allowed_cidrs](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable.vault_deploy_vault_license](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable) | resource |
| [tfe_variable_set.aws_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable_set) | resource |
| [tfe_variable_set.github_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable_set) | resource |
| [tfe_variable_set.tfe_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/variable_set) | resource |
| [tfe_workspace.consul_enterprise_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.consul_enterprise_deploy](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.github_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.hashistack_workload_demo](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.hcp_terraform_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.nomad_enterprise_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.nomad_enterprise_deploy](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.pingfederate_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.pingfederate_deploy](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.terraform_enterprise_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.terraform_enterprise_deploy](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.vault_enterprise_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace.vault_enterprise_deploy](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace) | resource |
| [tfe_workspace_variable_set.tfe_provider_authentication_hcp_terraform_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/resources/workspace_variable_set) | resource |
| [tfe_organization_membership.admins](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/data-sources/organization_membership) | data source |
| [tfe_variables.aws_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/data-sources/variables) | data source |
| [tfe_variables.pingfederate_deploy](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/data-sources/variables) | data source |
| [tfe_variables.vault_enterprise_deploy](https://registry.terraform.io/providers/hashicorp/tfe/0.74.1/docs/data-sources/variables) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admins_team_emails"></a> [admins\_team\_emails](#input\_admins\_team\_emails) | A list of member email addresses for the admins team. | `set(string)` | <pre>[<br/>  "craig.sloggett@hashicorp.com"<br/>]</pre> | no |
| <a name="input_application_environments"></a> [application\_environments](#input\_application\_environments) | A set of environments that applications will be deploying to. | `set(string)` | <pre>[<br/>  "development",<br/>  "production"<br/>]</pre> | no |
| <a name="input_github_organization_name"></a> [github\_organization\_name](#input\_github\_organization\_name) | The name of the GitHub organization used to configure the VCS provider. | `string` | `"craigsloggett-lab"` | no |
| <a name="input_github_vcs_provider_oauth_token"></a> [github\_vcs\_provider\_oauth\_token](#input\_github\_vcs\_provider\_oauth\_token) | The personal access token for a service account in the GitHub organization being connected. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use in all workspaces. | `string` | `"1.14.7"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
