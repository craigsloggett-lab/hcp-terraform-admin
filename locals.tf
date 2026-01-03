locals {
  # The non-sensitive variables in the AWS Provider Authentication variable set
  # will always drift since they are updated dynamically out of band. This
  # local variable is meant to be used as a way to get the values as configured
  # and then use those as the values defined in the `tfe_variable` resource
  # blocks.
  aws_provider_authentication = {
    for environment, variable_set in data.tfe_variables.aws_provider_authentication :
    environment => {
      for variable in variable_set.env :
      variable.name => variable.value
      if !variable.sensitive
    }
  }

  # Lookup the required variable explicitly, handling the case
  # when the variable set hasn't been created yet.
  aws_access_key_id_value = {
    for environment, variable in local.aws_provider_authentication :
    environment => lookup(variable, "AWS_ACCESS_KEY_ID", null)
  }

  # Lookup the required variable explicitly, handling the case
  # when the variable set hasn't been created yet.
  aws_session_expiration_value = {
    for environment, variable in local.aws_provider_authentication :
    environment => lookup(variable, "AWS_SESSION_EXPIRATION", null)
  }
}

# Terraform Modules Playground
locals {
  playground_modules = toset([
    "terraform-aws-alb",
    "terraform-aws-ec2-asg",
    "terraform-aws-elasticache",
    "terraform-aws-rds-postgres",
    "terraform-aws-s3-bucket",
    "terraform-aws-ssm-config",
    "terraform-aws-tfe-iam",
    "terraform-aws-tfe-orchestration"
  ])
}
