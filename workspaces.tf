resource "tfe_workspace" "data_platform_shared_services" {
  for_each = var.data_platform_environments

  name         = "${var.data_platform_shared_services_workspace_name}-${each.key}"
  organization = data.tfe_organization.this.name
  project_id   = tfe_project.data_platform.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    identifier     = "${var.github_organization_name}/${var.data_platform_shared_services_workspace_name}-${each.key}"
    oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
  }
}

moved {
  from = tfe_workspace.data_platform_azure_shared_services
  to   = tfe_workspace.data_platform_shared_services
}
