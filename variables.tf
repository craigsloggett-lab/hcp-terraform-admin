variable "aws_provider_authentication_variable_set_name" {
  type        = string
  description = "The name of the variable set used to authenticate the AWS Provider."
  default     = "AWS Provider Authentication"
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
