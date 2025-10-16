resource "tfe_team" "data_engineers" {
  name         = "data-engineers"
  organization = data.tfe_organization.this.name
  visibility   = "organization"

  organization_access {
    access_secret_teams        = false
    manage_agent_pools         = false
    manage_membership          = false
    manage_modules             = false
    manage_organization_access = false
    manage_policies            = false
    manage_policy_overrides    = false
    manage_projects            = false
    manage_providers           = false
    manage_run_tasks           = false
    manage_teams               = false
    manage_vcs_settings        = false
    manage_workspaces          = false
    read_projects              = true
    read_workspaces            = true
  }
}

resource "tfe_team" "data_platform_admins" {
  name         = "data-platform-admins"
  organization = data.tfe_organization.this.name
  visibility   = "organization"

  organization_access {
    access_secret_teams        = false
    manage_agent_pools         = false
    manage_membership          = false
    manage_modules             = false
    manage_organization_access = false
    manage_policies            = false
    manage_policy_overrides    = false
    manage_projects            = false
    manage_providers           = false
    manage_run_tasks           = false
    manage_teams               = false
    manage_vcs_settings        = false
    manage_workspaces          = false
    read_projects              = true
    read_workspaces            = true
  }
}

resource "tfe_team_project_access" "data_engineering_data_platform_admins" {
  access     = "write"
  team_id    = tfe_team.data_platform_admins.id
  project_id = tfe_project.data_engineering.id
}

resource "tfe_team_project_access" "data_engineering_data_engineers" {
  access     = "write"
  team_id    = tfe_team.data_engineers.id
  project_id = tfe_project.data_engineering.id
}

resource "tfe_team_project_access" "data_platform_data_platform_admins" {
  access     = "write"
  team_id    = tfe_team.data_platform_admins.id
  project_id = tfe_project.data_platform.id
}

resource "tfe_team_project_access" "modules_data_engineers" {
  access     = "write"
  team_id    = tfe_team.data_engineers.id
  project_id = tfe_project.modules.id
}

resource "tfe_team_project_access" "modules_data_platform_admins" {
  access     = "write"
  team_id    = tfe_team.data_platform_admins.id
  project_id = tfe_project.modules.id
}
