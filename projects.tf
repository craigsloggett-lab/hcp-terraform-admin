resource "tfe_project" "modules" {
  organization = data.tfe_organization.this.name
  name         = "Modules"
  description  = "A collection of workspaces to test modules."
}

resource "tfe_project" "stacks" {
  organization = data.tfe_organization.this.name
  name         = "Stacks"
  description  = "A collection of stacks."
}
