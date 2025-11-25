moved {
  from = module.bootstrap.tfe_organization.this
  to   = tfe_organization.this
}

resource "tfe_organization" "this" {
  name  = data.tfe_organization.this.name
  email = data.tfe_organization.this.email

  assessments_enforced = true
}

moved {
  from = module.bootstrap.tfe_organization_membership.this
  to   = tfe_organization_membership.this
}

resource "tfe_organization_membership" "this" {
  for_each = data.tfe_organization_membership.this

  organization = tfe_organization.this.name
  email        = each.value.email
}

moved {
  from = module.bootstrap.tfe_team.owners
  to   = tfe_team.owners
}

resource "tfe_team" "owners" {
  name         = data.tfe_team.owners.name
  organization = tfe_organization.this.name
}

moved {
  from = module.bootstrap.tfe_organization_members.owners
  to   = tfe_team_organization_members.owners
}

resource "tfe_team_organization_members" "owners" {
  team_id = tfe_team.owners.id
  organization_membership_ids = [
    "ou-9KRr8gq4h6JikktE",
    "ou-tSVPjvXHB4iTqcPb"
  ]
}

moved {
  from = module.bootstrap.tfe_project.default
  to   = tfe_project.default
}

resource "tfe_project" "default" {
  name         = data.tfe_project.default.name
  organization = tfe_organization.this.name
  description  = "The default project for new workspaces."
}
