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

resource "tfe_workspace" "terraform_aws_alb" {
  name       = "terraform_aws_alb"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-alb/examples/basic"
}

resource "tfe_workspace" "terraform_aws_ec2_asg" {
  name       = "terraform_aws_ec2_asg"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-ec2-asg/examples/basic"
}

resource "tfe_workspace" "terraform_aws_elasticache" {
  name       = "terraform_aws_elasticache"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-elasticache/examples/basic"
}

resource "tfe_workspace" "terraform_aws_rds_postgres" {
  name       = "terraform_aws_rds_postgres"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-rds-postgres/examples/basic"
}

resource "tfe_workspace" "terraform_aws_s3_bucket" {
  name       = "terraform_aws_s3_bucket"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-s3-bucket/examples/basic"
}

resource "tfe_workspace" "terraform_aws_ssm_config" {
  name       = "terraform_aws_ssm_config"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-ssm-config/examples/basic"
}

resource "tfe_workspace" "terraform_aws_tfe_iam" {
  name       = "terraform_aws_tfe_iam"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-tfe-iam/examples/basic"
}

resource "tfe_workspace" "terraform_aws_tfe_orchestration" {
  name       = "terraform_aws_tfe_orchestration"
  project_id = tfe_project.modules.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-modules-playground"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  working_directory = "terraform-aws-tfe-orchestration/examples/basic"
}
