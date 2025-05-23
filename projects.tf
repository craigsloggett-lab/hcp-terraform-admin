# The resources for the Default Project can be found in `bootstrap.tf`.
# The resources for the project configured in `backend.tf` can be found in `bootstrap.tf`.

resource "tfe_project" "modules" {
  name         = "Modules"
  organization = tfe_organization.this.name
  description  = "A collection of ephemeral workspaces to test modules."
}

resource "tfe_project" "lab" {
  name         = "Lab"
  organization = tfe_organization.this.name
  description  = "A collection of workspaces to manage the lab infrastructure."
}
