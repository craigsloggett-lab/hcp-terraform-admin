# Provide admin access to the 'Default Project' that comes with HCP Terraform.
resource "tfe_team_project_access" "backend" {
  access     = "admin"
  team_id    = tfe_team.admins.id
  project_id = data.tfe_project.default.id
}

resource "tfe_project" "admin" {
  organization = data.tfe_organization.this.name
  name         = "Administration"
  description  = "A collection of workspaces to manage the platform."
}

# Provide admin access to the 'Administration' project.
resource "tfe_team_project_access" "default" {
  access     = "admin"
  team_id    = tfe_team.admins.id
  project_id = tfe_project.admin.id
}

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
