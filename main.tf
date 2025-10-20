data "tfe_organization" "this" {
  name = var.hcp_terraform_organization_name
}

data "tfe_oauth_client" "github" {
  organization     = data.tfe_organization.this.name
  service_provider = "github"
}

moved {
  from = tfe_workspace.data_platform_shared_services
  to   = tfe_workspace.data_platform_azure_shared_services
}
