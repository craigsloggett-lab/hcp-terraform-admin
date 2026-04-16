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

resource "tfe_run_trigger" "hcp_terraform_admin_from_consul" {
  workspace_id  = tfe_workspace.hcp_terraform_admin.id
  sourceable_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "github_vcs_provider_oauth_token" {
  key          = "github_vcs_provider_oauth_token"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Set to a Personal Access Token for the service account in the craigsloggett-lab GitHub organization."
  workspace_id = tfe_workspace.hcp_terraform_admin.id
}

resource "tfe_workspace" "terraform_enterprise_deploy" {
  name       = "terraform-enterprise-deploy"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-enterprise-deploy"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_workspace" "terraform_enterprise_admin" {
  name       = "terraform-enterprise-admin"
  project_id = tfe_project.admin.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/terraform-enterprise-admin"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

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

data "tfe_variables" "vault_enterprise_deploy" {
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_project_name" {
  key          = "project_name"
  value        = "lab"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_route53_zone_name" {
  key          = "route53_zone_name"
  value        = "craig-sloggett.sbx.hashidemos.io"
  category     = "terraform"
  description  = "Name of the existing Route 53 hosted zone."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_vault_enterprise_license" {
  key          = "vault_enterprise_license"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Vault Enterprise license string."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_ec2_key_pair_name" {
  key          = "ec2_key_pair_name"
  value        = local.vault_deploy_ec2_key_pair_name
  category     = "terraform"
  description  = "Name of an existing EC2 key pair for SSH access."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_ec2_ami_owner" {
  key          = "ec2_ami_owner"
  value        = "888995627335"
  category     = "terraform"
  description  = "AWS account ID of the AMI owner."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_ec2_ami_name" {
  key          = "ec2_ami_name"
  value        = "hc-base-ubuntu-2404-amd64-*"
  category     = "terraform"
  description  = "Name filter for the AMI (supports wildcards)."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_nlb_internal" {
  key          = "nlb_internal"
  value        = "false"
  hcl          = true
  category     = "terraform"
  description  = "Whether the NLB is internal."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_vault_api_allowed_cidrs" {
  key          = "vault_api_allowed_cidrs"
  value        = "[\"0.0.0.0/0\"]"
  hcl          = true
  category     = "terraform"
  description  = "CIDR blocks allowed to reach the Vault API (port 8200)."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_vpc_name" {
  key          = "vpc_name"
  value        = "hashistack"
  category     = "terraform"
  description  = "Name tag of the existing VPC."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_vault_server_instance_type" {
  key          = "vault_server_instance_type"
  value        = "t3.medium"
  category     = "terraform"
  description  = "EC2 instance type for Vault server nodes."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_variable" "vault_deploy_hcp_terraform" {
  key          = "hcp_terraform_workspace_id"
  value        = tfe_workspace.vault_enterprise_admin.id
  category     = "terraform"
  description  = "HCP Terraform workspace ID used to scope the JWT auth role for the Vault admin workspace."
  workspace_id = tfe_workspace.vault_enterprise_deploy.id
}

data "tfe_outputs" "vault_enterprise_deploy" {
  organization = tfe_organization.this.name
  workspace    = tfe_workspace.vault_enterprise_deploy.name
}

data "aws_ssm_parameter" "vault_ca_bundle" {
  name = data.tfe_outputs.vault_enterprise_deploy.values.vault_tls_ca_bundle_ssm_name
}

resource "tfe_workspace" "vault_enterprise_admin" {
  name       = "vault-enterprise-admin"
  project_id = tfe_project.admin.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/vault-enterprise-admin"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_variable" "vault_admin_tfc_vault_provider_auth" {
  key          = "TFC_VAULT_PROVIDER_AUTH"
  value        = "true"
  category     = "env"
  description  = "Enable the Vault provider to authenticate using workload identity."
  workspace_id = tfe_workspace.vault_enterprise_admin.id
}

resource "tfe_variable" "vault_admin_tfc_vault_addr" {
  key          = "TFC_VAULT_ADDR"
  value        = data.tfe_outputs.vault_enterprise_deploy.values.vault_url
  category     = "env"
  description  = "The address of the Vault instance."
  workspace_id = tfe_workspace.vault_enterprise_admin.id
}

resource "tfe_variable" "vault_admin_tfc_vault_auth_path" {
  key          = "TFC_VAULT_AUTH_PATH"
  value        = "jwt"
  category     = "env"
  description  = "The path of the JWT auth backend in Vault."
  workspace_id = tfe_workspace.vault_enterprise_admin.id
}

resource "tfe_variable" "vault_admin_tfc_vault_role" {
  key          = "TFC_VAULT_RUN_ROLE"
  value        = "terraform-admin"
  category     = "env"
  description  = "The Vault role to authenticate as via JWT."
  workspace_id = tfe_workspace.vault_enterprise_admin.id
}

resource "tfe_variable" "vault_admin_tfc_vault_encoded_cacert" {
  key          = "TFC_VAULT_ENCODED_CACERT"
  value        = base64encode(data.aws_ssm_parameter.vault_ca_bundle.value)
  category     = "env"
  description  = "A PEM-encoded CA certificate that has been Base64 encoded."
  workspace_id = tfe_workspace.vault_enterprise_admin.id
}

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

data "tfe_variables" "nomad_enterprise_deploy" {
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_project_name" {
  key          = "project_name"
  value        = "lab"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_vpc_name" {
  key          = "vpc_name"
  value        = "hashistack"
  category     = "terraform"
  description  = "Name tag of the existing VPC."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_route53_zone_name" {
  key          = "route53_zone_name"
  value        = "craig-sloggett.sbx.hashidemos.io"
  category     = "terraform"
  description  = "Name of the existing Route 53 hosted zone."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nomad_license" {
  key          = "nomad_license"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Nomad Enterprise license string."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_ec2_key_pair_name" {
  key          = "ec2_key_pair_name"
  value        = local.nomad_deploy_ec2_key_pair_name
  category     = "terraform"
  description  = "Name of an existing EC2 key pair for SSH access."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_ec2_ami_owner" {
  key          = "ec2_ami_owner"
  value        = "888995627335"
  category     = "terraform"
  description  = "AWS account ID of the AMI owner."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_ec2_ami_name" {
  key          = "ec2_ami_name"
  value        = "hc-base-ubuntu-2404-amd64-*"
  category     = "terraform"
  description  = "Name filter for the AMI (supports wildcards)."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nomad_server_instance_type" {
  key          = "nomad_server_instance_type"
  value        = "t3.medium"
  category     = "terraform"
  description  = "EC2 instance type for Nomad server nodes."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nlb_internal" {
  key          = "nlb_internal"
  value        = "false"
  hcl          = true
  category     = "terraform"
  description  = "Whether the NLB is internal."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nomad_api_allowed_cidrs" {
  key          = "nomad_api_allowed_cidrs"
  value        = "[\"0.0.0.0/0\"]"
  hcl          = true
  category     = "terraform"
  description  = "CIDR blocks allowed to reach the Nomad API (port 4646)."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_consul_auto_join_ec2_tag" {
  key          = "consul_auto_join_ec2_tag"
  value        = jsonencode(data.tfe_outputs.consul_enterprise_deploy.values.consul_cluster_tag)
  hcl          = true
  category     = "terraform"
  description  = "EC2 tag used for Consul cloud auto-join."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_consul_ca_cert_secret_arn" {
  key          = "consul_ca_cert_secret_arn"
  value        = data.tfe_outputs.consul_enterprise_deploy.values.consul_ca_cert_secret_arn
  category     = "terraform"
  description  = "ARN of the Secrets Manager secret containing the Consul CA certificate."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_consul_gossip_key_secret_arn" {
  key          = "consul_gossip_key_secret_arn"
  value        = data.tfe_outputs.consul_enterprise_deploy.values.consul_gossip_key_secret_arn
  category     = "terraform"
  description  = "ARN of the Secrets Manager secret containing the Consul gossip encryption key."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_consul_token_secret_arn" {
  key          = "consul_token_secret_arn"
  value        = data.tfe_outputs.consul_enterprise_deploy.values.consul_token_secret_arn
  category     = "terraform"
  description  = "ARN of the Secrets Manager secret containing the Consul ACL token for Nomad."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_consul_datacenter" {
  key          = "consul_datacenter"
  value        = "dc1"
  category     = "terraform"
  description  = "Consul datacenter name."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nomad_server_service_name" {
  key          = "nomad_server_service_name"
  value        = data.tfe_outputs.consul_enterprise_deploy.values.nomad_server_service_name
  category     = "terraform"
  description  = "Consul service name Nomad servers register as."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nomad_client_service_name" {
  key          = "nomad_client_service_name"
  value        = data.tfe_outputs.consul_enterprise_deploy.values.nomad_client_service_name
  category     = "terraform"
  description  = "Consul service name Nomad clients register as."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nomad_client_instance_type" {
  key          = "nomad_client_instance_type"
  value        = "t3.medium"
  category     = "terraform"
  description  = "EC2 instance type for Nomad client nodes."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_nomad_snapshot_service_name" {
  key          = "nomad_snapshot_service_name"
  value        = data.tfe_outputs.consul_enterprise_deploy.values.nomad_snapshot_service_name
  category     = "terraform"
  description  = "Consul service name the Nomad snapshot agent registers as."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_consul_version" {
  key          = "consul_version"
  value        = "1.22.6+ent"
  category     = "terraform"
  description  = "Consul Enterprise release version for the local client agent."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "nomad_deploy_client_count" {
  key          = "client_count"
  value        = "3"
  category     = "terraform"
  description  = "Number of Nomad client nodes to deploy."
  workspace_id = tfe_workspace.nomad_enterprise_deploy.id
}

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

data "tfe_variables" "consul_enterprise_deploy" {
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

data "tfe_outputs" "consul_enterprise_deploy" {
  organization = tfe_organization.this.name
  workspace    = tfe_workspace.consul_enterprise_deploy.name
}

resource "tfe_variable" "consul_deploy_project_name" {
  key          = "project_name"
  value        = "lab"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_vpc_name" {
  key          = "vpc_name"
  value        = "hashistack"
  category     = "terraform"
  description  = "Name tag of the existing VPC."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_route53_zone_name" {
  key          = "route53_zone_name"
  value        = "craig-sloggett.sbx.hashidemos.io"
  category     = "terraform"
  description  = "Name of the existing Route 53 hosted zone."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_consul_license" {
  key          = "consul_license"
  value        = ""
  sensitive    = true
  category     = "terraform"
  description  = "Consul Enterprise license string."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_ec2_key_pair_name" {
  key          = "ec2_key_pair_name"
  value        = local.consul_deploy_ec2_key_pair_name
  category     = "terraform"
  description  = "Name of an existing EC2 key pair for SSH access."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_ec2_ami_owner" {
  key          = "ec2_ami_owner"
  value        = "888995627335"
  category     = "terraform"
  description  = "AWS account ID of the AMI owner."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_ec2_ami_name" {
  key          = "ec2_ami_name"
  value        = "hc-base-ubuntu-2404-amd64-*"
  category     = "terraform"
  description  = "Name filter for the AMI (supports wildcards)."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_nlb_internal" {
  key          = "nlb_internal"
  value        = "false"
  hcl          = true
  category     = "terraform"
  description  = "Whether the NLB is internal."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_consul_api_allowed_cidrs" {
  key          = "consul_api_allowed_cidrs"
  value        = "[\"0.0.0.0/0\"]"
  hcl          = true
  category     = "terraform"
  description  = "CIDR blocks allowed to reach the Consul API (port 8501)."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_variable" "consul_deploy_consul_server_instance_type" {
  key          = "consul_server_instance_type"
  value        = "t3.medium"
  category     = "terraform"
  description  = "EC2 instance type for Consul server nodes."
  workspace_id = tfe_workspace.consul_enterprise_deploy.id
}

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

resource "tfe_variable" "hashistack_aws_vpc_project_name" {
  key          = "project_name"
  value        = "hashistack"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.hashistack_aws_vpc.id
}

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

resource "tfe_variable" "pingfederate_artifacts_project_name" {
  key          = "project_name"
  value        = "lab"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.pingfederate_artifacts.id
}

resource "tfe_workspace" "pingfederate_deploy" {
  name       = "pingfederate-deploy"
  project_id = tfe_project.infrastructure.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/pingfederate-deploy"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

data "tfe_variables" "pingfederate_deploy" {
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_project_name" {
  key          = "project_name"
  value        = "lab"
  category     = "terraform"
  description  = "Name prefix for all resources."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_route53_zone_name" {
  key          = "route53_zone_name"
  value        = "craig-sloggett.sbx.hashidemos.io"
  category     = "terraform"
  description  = "Name of the existing Route 53 hosted zone."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_vpc_name" {
  key          = "vpc_name"
  value        = "hashistack"
  category     = "terraform"
  description  = "Name tag of the existing VPC."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_ec2_key_pair_name" {
  key          = "ec2_key_pair_name"
  value        = local.pingfederate_deploy_ec2_key_pair_name
  category     = "terraform"
  description  = "Name of an existing EC2 key pair for SSH access."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_ec2_ami_owner" {
  key          = "ec2_ami_owner"
  value        = "888995627335"
  category     = "terraform"
  description  = "AWS account ID of the AMI owner."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

resource "tfe_variable" "pingfederate_deploy_ec2_ami_name" {
  key          = "ec2_ami_name"
  value        = "hc-base-ubuntu-2404-amd64-*"
  category     = "terraform"
  description  = "Name filter for the AMI (supports wildcards)."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

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

resource "tfe_variable" "pingfederate_deploy_nlb_internal" {
  key          = "nlb_internal"
  value        = "false"
  hcl          = true
  category     = "terraform"
  description  = "Whether the NLB is internal."
  workspace_id = tfe_workspace.pingfederate_deploy.id
}

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

resource "tfe_workspace" "hashistack_workload_demo" {
  name       = "hashistack-workload-demo"
  project_id = tfe_project.workloads.id

  auto_apply            = true
  queue_all_runs        = true
  terraform_version     = var.terraform_version
  file_triggers_enabled = false

  vcs_repo {
    branch         = "main"
    identifier     = "${var.github_organization_name}/hashistack-workload-demo"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}
