moved {
  from = tfe_workspace_variable_set.hcp_terraform_admin_tfe_provider_authentication
  to   = tfe_workspace_variable_set.tfe_provider_authentication_hcp_terraform_admin
}

moved {
  from = tfe_project_variable_set.aws_provider_authentication_dev
  to   = tfe_project_variable_set.aws_provider_authentication_dev_waypoint
}
