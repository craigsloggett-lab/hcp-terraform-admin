# HCP Terraform Admin

An infrastructure as code repository to manage the `craigsloggett-lab` HCP Terraform organization.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bootstrap"></a> [bootstrap](#module\_bootstrap) | git::https://github.com/craigsloggett-lab/terraform-tfe-bootstrap | v0.10.2 |

## Resources

| Name | Type |
|------|------|
| [tfe_oauth_client.github](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/oauth_client) | resource |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/organization) | resource |
| [tfe_organization_membership.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/organization_membership) | resource |
| [tfe_project.admin](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_project.default](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_project.modules](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_project.stacks](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_registry_provider.hashicorp](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/registry_provider) | resource |
| [tfe_team.admins](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team) | resource |
| [tfe_team.owners](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team) | resource |
| [tfe_team_organization_members.admins](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team_organization_members) | resource |
| [tfe_team_organization_members.owners](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team_organization_members) | resource |
| [tfe_team_project_access.admins_administration](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team_project_access) | resource |
| [tfe_team_project_access.admins_default_project](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team_project_access) | resource |
| [tfe_variable.github_vcs_provider_oauth_token](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/variable) | resource |
| [tfe_variable.tfe_token](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/variable) | resource |
| [tfe_variable_set.tfe_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/variable_set) | resource |
| [tfe_workspace.hcp_terraform_admin](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/workspace) | resource |
| [tfe_workspace_variable_set.hcp_terraform_admin_tfe_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/workspace_variable_set) | resource |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organization) | data source |
| [tfe_organization_members.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organization_members) | data source |
| [tfe_organization_membership.admins](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organization_membership) | data source |
| [tfe_organizations.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organizations) | data source |
| [tfe_project.default](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/project) | data source |
| [tfe_team.owners](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admins_team_emails"></a> [admins\_team\_emails](#input\_admins\_team\_emails) | A list of member email addresses for the admins team. | `set(string)` | <pre>[<br/>  "craig.sloggett@hashicorp.com"<br/>]</pre> | no |
| <a name="input_github_organization_name"></a> [github\_organization\_name](#input\_github\_organization\_name) | The name of the GitHub organization used to configure the VCS provider. | `string` | `"craigsloggett-lab"` | no |
| <a name="input_github_vcs_provider_oauth_token"></a> [github\_vcs\_provider\_oauth\_token](#input\_github\_vcs\_provider\_oauth\_token) | The personal access token for a service account in the GitHub organization being connected. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | The version of Terraform to use in all workspaces. | `string` | `"1.14.0"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
