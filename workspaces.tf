# HCP Terraform Admin

resource "tfe_workspace" "hcp_terraform_admin" {
  name       = "hcp-terraform-admin"
  project_id = tfe_project.admin.id

  auto_apply             = true
  auto_apply_run_trigger = true
  queue_all_runs         = true
  terraform_version      = var.terraform_version
  file_triggers_enabled  = false

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

## Run Triggers

resource "tfe_run_trigger" "hcp_terraform_admin_vault_enterprise_deploy" {
  workspace_id  = tfe_workspace.hcp_terraform_admin.id
  sourceable_id = tfe_workspace.vault_enterprise_deploy.id
}

# Vault Enterprise Deploy

resource "tfe_workspace" "vault_enterprise_deploy" {
  name       = "vault-enterprise-deploy"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/vault-enterprise-deploy"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "vault_enterprise_deploy" {
  workspace_id   = tfe_workspace.vault_enterprise_deploy.id
  execution_mode = "remote"
}

## Variables

resource "tfe_variable" "vault_enterprise_deploy_vault_enterprise_license" {
  key          = "vault_enterprise_license"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Vault Enterprise license string."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_enterprise_deploy_vault_api_allowed_cidrs" {
  key          = "vault_api_allowed_cidrs"
  value        = "[\"0.0.0.0/0\"]"
  hcl          = true
  category     = "terraform"
  description  = "CIDR blocks allowed to reach the Vault API (port 8200)."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_enterprise_deploy_vault_server_instance_type" {
  key          = "vault_server_instance_type"
  value        = "t3.medium"
  category     = "terraform"
  description  = "EC2 instance type for Vault server nodes."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

# Nomad Enterprise Deploy

resource "tfe_workspace" "nomad_enterprise_deploy" {
  name       = "nomad-enterprise-deploy"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/nomad-enterprise-deploy"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "nomad_enterprise_deploy" {
  workspace_id   = tfe_workspace.nomad_enterprise_deploy.id
  execution_mode = "remote"
}

## Variables

resource "tfe_variable" "nomad_enterprise_deploy_nomad_enterprise_license" {
  key          = "nomad_enterprise_license"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Nomad Enterprise license string."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_enterprise_deploy_nomad_api_allowed_cidrs" {
  key          = "nomad_api_allowed_cidrs"
  value        = "[\"0.0.0.0/0\"]"
  hcl          = true
  category     = "terraform"
  description  = "CIDR blocks allowed to reach the Nomad API (port 4646) from outside the VPC. Only effective when nlb_internal is false."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

# Consul Enterprise Deploy

resource "tfe_workspace" "consul_enterprise_deploy" {
  name       = "consul-enterprise-deploy"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/consul-enterprise-deploy"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "consul_enterprise_deploy" {
  workspace_id   = tfe_workspace.consul_enterprise_deploy.id
  execution_mode = "remote"
}

## Variables

resource "tfe_variable" "consul_enterprise_deploy_consul_enterprise_license" {
  key          = "consul_enterprise_license"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Consul Enterprise license string."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_enterprise_deploy_consul_api_allowed_cidrs" {
  key          = "consul_api_allowed_cidrs"
  value        = "[\"0.0.0.0/0\"]"
  hcl          = true
  category     = "terraform"
  description  = "CIDR blocks allowed to reach the Consul API (port 8501) from outside the VPC. Only effective when nlb_internal is false."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_enterprise_deploy_consul_server_instance_type" {
  key          = "consul_server_instance_type"
  value        = "t3.medium"
  category     = "terraform"
  description  = "EC2 instance type for Consul server nodes."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
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

# PingFederate Artifacts

resource "tfe_workspace" "pingfederate_artifacts" {
  name       = "pingfederate-artifacts"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/pingfederate-artifacts"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "pingfederate_artifacts" {
  workspace_id   = tfe_workspace.pingfederate_artifacts.id
  execution_mode = "remote"
}

## Variables

resource "tfe_variable" "pingfederate_artifacts_project_name" {
  key          = "project_name"
  value        = "lab"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.pingfederate_artifacts.id
}

# PingFederate Deploy

resource "tfe_workspace" "pingfederate_deploy" {
  name       = "pingfederate-deploy"
  project_id = tfe_project.infrastructure.id

  auto_apply            = false
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/pingfederate-deploy"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "pingfederate_deploy" {
  workspace_id   = tfe_workspace.pingfederate_deploy.id
  execution_mode = "remote"
}

## Variables

resource "tfe_variable" "pingfederate_deploy_pingfederate_allowed_cidrs" {
  key          = "pingfederate_allowed_cidrs"
  value        = "[\"0.0.0.0/0\"]"
  hcl          = true
  category     = "terraform"
  description  = "External CIDR blocks allowed to access PingFederate (ports 9999 and 9031)."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_s3_artifact_bucket" {
  key          = "s3_artifact_bucket"
  value        = "lab-pingfederate-703951826048-us-east-1-an"
  category     = "terraform"
  description  = "Name of the S3 bucket containing PingFederate distribution artifacts."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_pingfederate_zip_key" {
  key          = "pingfederate_zip_key"
  value        = "pingfederate-13.0.1.zip"
  category     = "terraform"
  description  = "S3 object key for the PingFederate distribution zip file."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_pingfederate_license_key" {
  key          = "pingfederate_license_key"
  value        = "PingFederate-13.0-Development.lic"
  category     = "terraform"
  description  = "S3 object key for the PingFederate license file."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

# GitHub Admin

resource "tfe_workspace" "github_admin" {
  name       = "github-admin"
  project_id = tfe_project.admin.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/github-admin"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace_settings" "github_admin" {
  workspace_id   = tfe_workspace.github_admin.id
  execution_mode = "remote"
}

# HCP Terraform Agents

resource "tfe_workspace" "hcp_terraform_agents" {
  name       = "hcp-terraform-agents"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
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
