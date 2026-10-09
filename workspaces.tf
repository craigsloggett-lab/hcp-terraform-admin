# HCP Terraform Admin

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

## Variables

resource "tfe_variable" "hcp_terraform_admin_github_vcs_provider_oauth_token" {
  key          = "github_vcs_provider_oauth_token"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Set to a Personal Access Token for the service account in the craigsloggett-lab GitHub organization."
  workspace_id = tfe_workspace.hcp_terraform_admin.id
}

# HashiStack AWS VPC

resource "tfe_workspace" "hashistack_aws_vpc" {
  name       = "hashistack-aws-vpc"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/hashistack-aws-vpc"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "hashistack_aws_vpc" {
  workspace_id   = tfe_workspace.hashistack_aws_vpc.id
  execution_mode = "remote"
}

## Variables

resource "tfe_variable" "hashistack_aws_vpc_project_name" {
  key          = "project_name"
  value        = "hashistack"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.hashistack_aws_vpc.id
}

# TODO: Remove this and configure the provider

resource "tfe_variable" "hashistack_aws_vpc_region" {
  key          = "region"
  value        = "us-east-1"
  category     = "terraform"
  description  = "AWS region to deploy into."
  workspace_id = tfe_workspace.hashistack_aws_vpc.id
}

resource "tfe_variable" "hashistack_vpc_enable_vpc_endpoints" {
  key          = "enable_vpc_endpoints"
  value        = "{ kms = true }"
  hcl          = true
  category     = "terraform"
  description  = "VPC endpoints to provision."
  workspace_id = tfe_workspace.hashistack_aws_vpc.id
}
