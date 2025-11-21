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
| <a name="module_bootstrap"></a> [bootstrap](#module\_bootstrap) | git::https://github.com/craigsloggett-lab/terraform-tfe-bootstrap | v0.10.1 |

## Resources

| Name | Type |
|------|------|
| [tfe_project.modules](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_project.stacks](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_registry_module.bootstrap](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/registry_module) | resource |
| [tfe_registry_provider.hashicorp](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/registry_provider) | resource |
| [tfe_test_variable.bootstrap_tfe_provider_authentication_tfe_token](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/test_variable) | resource |
| [tfe_oauth_client.github](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/oauth_client) | data source |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organization) | data source |
| [tfe_organizations.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organizations) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
