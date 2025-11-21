resource "tfe_oauth_client" "github" {
  name                = "craigsloggett-lab-testing"
  organization        = data.tfe_organization.this.name
  api_url             = "https://api.github.com"
  http_url            = "https://github.com"
  oauth_token         = var.github_personal_access_token
  service_provider    = "github"
  organization_scoped = true
}
