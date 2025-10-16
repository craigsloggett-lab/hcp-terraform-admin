resource "tfe_project" "modules" {
  name         = "Modules"
  organization = data.tfe_organization.this.name
  description  = "A collection of workspaces to test modules."
}
