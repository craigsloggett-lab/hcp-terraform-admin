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

data "tfe_project" "default" {
  organization = data.tfe_organization.this.name
  name         = "Default Project"
}

data "tfe_oauth_client" "github" {
  organization     = data.tfe_organization.this.name
  service_provider = "github"
}
