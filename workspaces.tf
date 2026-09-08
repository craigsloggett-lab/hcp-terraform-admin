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

# HCP Terraform Agents

resource "tfe_workspace" "hcp_terraform_agents" {
  name       = "hcp-terraform-agents"
  project_id = tfe_project.infrastructure.id

  auto_apply            = false
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/hcp-terraform-agents"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

## Variables

resource "tfe_variable" "hcp_terraform_agents_project_name" {
  key          = "project_name"
  value        = "lab"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.hcp_terraform_agents.id
}

resource "tfe_variable" "hcp_terraform_agents_vpc_name" {
  key          = "vpc_name"
  value        = "hashistack"
  category     = "terraform"
  description  = "Name of the VPC to deploy into."
  workspace_id = tfe_workspace.hcp_terraform_agents.id
}

resource "tfe_variable" "hcp_terraform_agents_aws_ami" {
  key          = "aws_ami"
  value        = "{ owner = \"888995627335\", name = \"hc-base-ubuntu-2404-amd64-20260420144356\" }"
  hcl          = true
  category     = "terraform"
  description  = "AMI owner and name filter for the agent instances."
  workspace_id = tfe_workspace.hcp_terraform_agents.id
}

resource "tfe_variable" "hcp_terraform_agents_tfc_agent_token" {
  key          = "tfc_agent_token"
  value        = tfe_agent_token.this.token
  sensitive    = true
  category     = "terraform"
  description  = "HCP Terraform agent pool token."
  workspace_id = tfe_workspace.hcp_terraform_agents.id
}

# HashiStack Workload Demo

resource "tfe_workspace" "hashistack_workload_demo" {
  name       = "hashistack-workload-demo"
  project_id = tfe_project.workloads.id

  auto_apply            = false
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/hashistack-workload-demo"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "hashistack_workload_demo" {
  workspace_id   = tfe_workspace.hashistack_workload_demo.id
  execution_mode = "remote"
}
