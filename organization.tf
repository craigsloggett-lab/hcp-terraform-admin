resource "tfe_organization" "this" {
  name  = data.tfe_organization.this.name
  email = data.tfe_organization.this.email

  assessments_enforced = true
}

resource "tfe_organization_membership" "this" {
  for_each = data.tfe_organization_membership.this

  organization = tfe_organization.this.name
  email        = each.value.email
}

resource "tfe_team" "owners" {
  name         = data.tfe_team.owners.name
  organization = tfe_organization.this.name
}

resource "tfe_team_organization_members" "owners" {
  team_id = tfe_team.owners.id
  organization_membership_ids = [
    "ou-9KRr8gq4h6JikktE",
    "ou-tSVPjvXHB4iTqcPb"
  ]
}

resource "tfe_project" "default" {
  name         = data.tfe_project.default.name
  organization = tfe_organization.this.name
  description  = "The default project for new workspaces."
}
