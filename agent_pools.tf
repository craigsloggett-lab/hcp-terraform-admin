resource "tfe_agent_pool" "this" {
  name = "craigsloggett-lab-agent-pool"
}

resource "tfe_agent_token" "this" {
  agent_pool_id = tfe_agent_pool.this.id
  description   = "lab-hcp-terraform-agents"
}
