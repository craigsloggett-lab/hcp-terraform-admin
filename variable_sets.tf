data "tfe_variable_set" "tfe_provider_authentication" {
  organization = data.tfe_organization.this.name
  name         = var.tfe_provider_authentication_variable_set_name
}
