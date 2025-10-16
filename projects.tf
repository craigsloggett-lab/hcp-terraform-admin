resource "tfe_project" "modules" {
  name         = "Modules"
  organization = data.tfe_organization.this.name
  description  = "A collection of workspaces to test modules."
}

resource "tfe_project" "data_platform" {
  name         = "Data Platform"
  organization = data.tfe_organization.this.name
  description  = "A collection of workspaces to manage shared services for the Data Platform."
}

resource "tfe_project" "data_engineering" {
  name         = "Data Engineering"
  organization = data.tfe_organization.this.name
  description  = "A collection of workspaces to manage the resources created by Data Engineers."
}
