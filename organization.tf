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

resource "tfe_organization" "this" {
  name  = module.bootstrap.tfe_organization.this.name
  email = module.bootstrap.tfe_organization.this.email

  assessments_enforced = true
}

resource "tfe_organization_membership" "this" {
  for_each = module.bootstrap.tfe_organization_membership

  email = each.value.email
}
