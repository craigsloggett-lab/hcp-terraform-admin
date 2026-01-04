resource "tfe_workspace" "hcp_terraform_admin" {
  name       = "hcp-terraform-admin"
  project_id = tfe_project.admin.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/hcp-terraform-admin"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_variable" "github_vcs_provider_oauth_token" {
  key          = "github_vcs_provider_oauth_token"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Set to a Personal Access Token for the service account in the craigsloggett-lab GitHub organization."
  workspace_id = tfe_workspace.hcp_terraform_admin.id
}

resource "tfe_workspace" "terraform_modules_playground" {
  for_each   = local.playground_modules
  name       = each.key
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = true

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "${each.key}/examples/basic"
  trigger_patterns  = ["${each.key}/**/*"]
}

resource "tfe_variable" "vpc_name" {
  for_each     = toset(["terraform-aws-rds-postgres", "terraform-aws-elasticache"])
  key          = "vpc_name"
  value        = "tfe-vpc-001"
  category     = "terraform"
  description  = "The name of the VPC (as defined in the Name tag) where the RDS instance will be deployed."
  workspace_id = tfe_workspace.terraform_modules_playground[each.key].id
}
