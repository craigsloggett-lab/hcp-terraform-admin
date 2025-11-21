data "tfe_organizations" "this" {}

data "tfe_organization" "this" {
  name = data.tfe_organizations.this.names[0]

  lifecycle {
    precondition {
      condition     = length(data.tfe_organizations.this.names) == 1
      error_message = "Expected exactly one TFE organization for this token, but found ${length(data.tfe_organizations.this.names)}."
    }
  }
}

data "tfe_oauth_client" "github" {
  organization     = data.tfe_organization.this.name
  service_provider = "github"
}

module "bootstrap" {
  source  = "app.terraform.io/craigsloggett-lab/bootstrap/tfe"
  version = "0.0.3"
  # insert required variables here

  tfe_organization = {
    email = "craig.sloggett@hashicorp.com"
  }
}
