variable "hcp_terraform_organization_name" {
  type        = string
  description = "The name of the HCP Terraform organization being managed."
  default     = "craigsloggett-lab"
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform to use in all workspaces."
  default     = "1.13.3"
}

variable "github_organization_name" {
  type        = string
  description = "The name of the GitHub organization used to configure the VCS provider."
  default     = "craigsloggett-lab"
}

variable "azurerm_provider_authentication_variable_set_name" {
  type        = string
  description = "The name of the variable set used to authenticate the Azure Provider."
  default     = "Azure Provider Authentication"
}

variable "fabric_provider_authentication_variable_set_name" {
  type        = string
  description = "The name of the variable set used to authenticate the Fabric Provider."
  default     = "Microsoft Fabric Provider Authentication"
}

variable "data_platform_shared_services_workspace_name" {
  type        = string
  description = "The name of the workspace managing the Data Platform shared services infrastructure."
  default     = "azure-fabric-shared-services"
}
