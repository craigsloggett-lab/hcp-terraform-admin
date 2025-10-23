resource "tfe_workspace" "data_platform_shared_services" {
  name         = var.data_platform_shared_services_workspace_name
  organization = data.tfe_organization.this.name
  project_id   = tfe_project.data_platform.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    identifier     = "${var.github_organization_name}/${var.data_platform_shared_services_workspace_name}"
    oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "data_platform_shared_services" {
  workspace_id        = tfe_workspace.data_platform_shared_services.id
  global_remote_state = false
}

resource "tfe_variable" "data_platform_shared_services_github_personal_access_token" {
  key          = "github_personal_access_token"
  value_wo     = ""
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.data_platform_shared_services.id
  description  = "Set to a personal access token for a Service Account in the GitHub Organization."
}
