data "tfe_organization" "this" {
  name = "craigsloggett-lab"
}

data "tfe_oauth_client" "github" {
  organization     = data.tfe_organization.this.id
  service_provider = "github"
}
