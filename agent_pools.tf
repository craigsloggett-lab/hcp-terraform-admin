resource "tfe_agent_pool" "this" {
  name = "craigsloggett-lab-agent-pool"
}

resource "tfe_agent_token" "this" {
  agent_pool_id = tfe_agent_pool.this.id
  description   = "lab-hcp-terraform-agents"
}

resource "tfe_workspace_settings" "vault_enterprise_deploy" {
  workspace_id   = tfe_workspace.vault_enterprise_deploy.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}

resource "tfe_workspace_settings" "nomad_enterprise_deploy" {
  workspace_id   = tfe_workspace.nomad_enterprise_deploy.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}

resource "tfe_workspace_settings" "consul_enterprise_deploy" {
  workspace_id   = tfe_workspace.consul_enterprise_deploy.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}

resource "tfe_workspace_settings" "hashistack_aws_vpc" {
  workspace_id   = tfe_workspace.hashistack_aws_vpc.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}

resource "tfe_workspace_settings" "pingfederate_artifacts" {
  workspace_id   = tfe_workspace.pingfederate_artifacts.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}

resource "tfe_workspace_settings" "pingfederate_deploy" {
  workspace_id   = tfe_workspace.pingfederate_deploy.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}

resource "tfe_workspace_settings" "github_admin" {
  workspace_id   = tfe_workspace.github_admin.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}

resource "tfe_workspace_settings" "hashistack_workload_demo" {
  workspace_id   = tfe_workspace.hashistack_workload_demo.id
  execution_mode = "agent"
  agent_pool_id  = tfe_agent_pool.this.id
}
