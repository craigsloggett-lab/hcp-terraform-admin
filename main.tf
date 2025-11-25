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

data "tfe_team" "owners" {
  organization = data.tfe_organization.this.name
  name         = "owners"
}

data "tfe_project" "default" {
  organization = data.tfe_organization.this.name
  name         = "Default Project"
}

## The bootstrap module is essentially a data source for all of the identifiers being imported.
#module "bootstrap" {
#  source = "git::https://github.com/craigsloggett-lab/terraform-tfe-bootstrap?ref=v0.10.2"
#}
