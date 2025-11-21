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
| <a name="module_bootstrap"></a> [bootstrap](#module\_bootstrap) | git::https://github.com/craigsloggett-lab/hcp-terraform-bootstrap | restructure-as-module |

## Resources

| Name | Type |
|------|------|
| [tfe_project.modules](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_project.stacks](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_registry_provider.hashicorp](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/registry_provider) | resource |
| [tfe_oauth_client.github](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/oauth_client) | data source |
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organization) | data source |
| [tfe_organizations.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/organizations) | data source |
| [tfe_variable_set.tfe_provider_authentication](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/data-sources/variable_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfe_provider_authentication_variable_set_name"></a> [tfe\_provider\_authentication\_variable\_set\_name](#input\_tfe\_provider\_authentication\_variable\_set\_name) | The name of the variable set used to authenticate the TFE Provider. | `string` | `"TFE Provider Authentication"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_outputs"></a> [module\_outputs](#output\_module\_outputs) | . |
| <a name="output_tfe_oauth_client_id"></a> [tfe\_oauth\_client\_id](#output\_tfe\_oauth\_client\_id) | The ID of the VCS Provider configuration. |
| <a name="output_tfe_provider_authentication_variable_set_name"></a> [tfe\_provider\_authentication\_variable\_set\_name](#output\_tfe\_provider\_authentication\_variable\_set\_name) | The name of the TFE Provider Authentication variable set. |
<!-- END_TF_DOCS -->
