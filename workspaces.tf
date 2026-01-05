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
  for_each     = toset(["terraform-aws-rds-postgres", "terraform-aws-elasticache", "terraform-aws-alb"])
  key          = "vpc_name"
  value        = "tfe-vpc-001"
  category     = "terraform"
  description  = "The name of the VPC (as defined in the Name tag) where the RDS instance will be deployed."
  workspace_id = tfe_workspace.terraform_modules_playground[each.key].id
}

resource "tfe_variable" "s3_bucket_name" {
  key          = "s3_bucket_name"
  value        = "703951826048-ca-central-1-terraform-enterprise-001"
  category     = "terraform"
  description  = "The name of the S3 bucket used by Terraform Enterprise."
  workspace_id = tfe_workspace.terraform_modules_playground["terraform-aws-tfe-iam"].id
}

resource "tfe_variable" "rds_secret_arn" {
  key          = "rds_secret_arn"
  value        = "arn:aws:secretsmanager:ca-central-1:703951826048:secret:rds!db-3252334e-9b18-49f3-af8e-c7ff0cc1f6da-EXY0Un"
  category     = "terraform"
  description  = "The ARN of the RDS database secret."
  workspace_id = tfe_workspace.terraform_modules_playground["terraform-aws-tfe-iam"].id
}
