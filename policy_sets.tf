# Global Policy Set

resource "tfe_policy_set" "global" {
  name                = "sentinel-policies-global"
  description         = "A global set of policies to apply across the whole organization."
  organization        = data.tfe_organization.this.name
  kind                = "sentinel"
  agent_enabled       = true
  policies_path       = "policy-sets/global"
  policy_tool_version = var.sentinel_version
  global              = true

  vcs_repo {
    identifier     = "${var.github_organization_name}/${var.sentinel_policy_sets_repository_name}"
    oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
  }
}
