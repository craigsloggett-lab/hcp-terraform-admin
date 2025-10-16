data "tfe_organization" "this" {
  name = var.hcp_terraform_organization_name
}

data "tfe_oauth_client" "github" {
  organization     = data.tfe_organization.this.name
  service_provider = "github"
}
