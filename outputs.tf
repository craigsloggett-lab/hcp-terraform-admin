output "tfc_agent_token" {
  description = "HCP Terraform Agent token."
  value       = tfe_agent_token.this.token
  sensitive   = true
}
