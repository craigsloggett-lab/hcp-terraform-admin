data "tfe_organization_membership" "admins" {
  for_each = var.admins_team_emails
  email    = each.key
}
