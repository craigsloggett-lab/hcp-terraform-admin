# The resources for the variable set containing authentication for the TFE provider can be found in `bootstrap.tf`.

resource "tfe_variable_set" "aws_provider_authentication" {
  name         = var.aws_provider_authentication_variable_set_name
  description  = "The tokens used to authenticate the AWS provider."
  organization = tfe_organization.this.name
}

resource "tfe_project_variable_set" "modules" {
  project_id      = tfe_project.modules.id
  variable_set_id = tfe_variable_set.aws_provider_authentication.id
}

resource "tfe_project_variable_set" "lab" {
  project_id      = tfe_project.lab.id
  variable_set_id = tfe_variable_set.aws_provider_authentication.id
}
