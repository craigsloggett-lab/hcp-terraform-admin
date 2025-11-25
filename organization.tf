resource "tfe_organization" "this" {
  name  = module.bootstrap.tfe_organization.this.name
  email = module.bootstrap.tfe_organization.this.email

  assessments_enforced = true
}

resource "tfe_organization_membership" "this" {
  for_each = module.bootstrap.tfe_organization_membership

  email = each.value.email
}
