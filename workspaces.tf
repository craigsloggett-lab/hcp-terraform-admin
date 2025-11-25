resource "tfe_workspace" "hcp_terraform_admin" {
  name         = "hcp-terraform-admin"
  organization = data.tfe_organization.this.name
  project_id   = tfe_project.admin.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch                     = "main"
    identifier                 = "${var.github_organization_name}/hcp-terraform-admin"
    github_app_installation_id = data.tfe_github_app_installation.this.id
  }
}

resource "tfe_variable" "github_personal_access_token" {
  key          = "github_personal_access_token"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Set to a Personal Access Token for a GitHub service account."
  workspace_id = tfe_workspace.hcp_terraform_admin.id
}
