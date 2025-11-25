data "tfe_organizations" "this" {}

data "tfe_organization" "this" {
  name = data.tfe_organizations.this.names[0]

  lifecycle {
    precondition {
      condition     = length(data.tfe_organizations.this.names) == 1
      error_message = "Expected exactly one TFE organization for this token, but found ${length(data.tfe_organizations.this.names)}."
    }
  }
}

data "tfe_organization_members" "this" {
  organization = data.tfe_organization.this.name
}

data "tfe_organization_membership" "this" {
  for_each = toset(data.tfe_organization_members.this.members[*].organization_membership_id)

  organization               = data.tfe_organization.this.name
  organization_membership_id = each.value
}

resource "tfe_organization" "this" {
  name  = module.bootstrap.tfe_organization.this.name
  email = data.tfe_organization.this.email

  assessments_enforced = true
}

resource "tfe_organization_membership" "this" {
  for_each = data.tfe_organization_membership.this

  organization = tfe_organization.this.name
  email        = each.value.email
}
