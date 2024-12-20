resource "tfe_team" "admins" {
  name         = var.hcp_terraform_admins_team_name
  organization = tfe_organization.this.name
  visibility   = "secret"

  organization_access {
    access_secret_teams        = true
    manage_agent_pools         = true
    manage_membership          = true
    manage_modules             = true
    manage_organization_access = false
    manage_policies            = true
    manage_policy_overrides    = true
    manage_projects            = true
    manage_providers           = true
    manage_run_tasks           = true
    manage_teams               = true
    manage_vcs_settings        = true
    manage_workspaces          = true
    read_projects              = true
    read_workspaces            = true
  }
}

resource "tfe_team_organization_members" "admins" {
  team_id = tfe_team.admins.id
  organization_membership_ids = [
    data.tfe_organization_membership.owner.id
  ]
}

resource "tfe_team_project_access" "admins" {
  access     = "admin"
  team_id    = tfe_team.admins.id
  project_id = tfe_project.platform_team.id
}
