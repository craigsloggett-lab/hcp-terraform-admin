resource "tfe_registry_provider" "hashicorp" {
  for_each      = toset(["tfe"])
  organization  = data.tfe_organization.this.name
  name          = each.key
  registry_name = "public"
  namespace     = "hashicorp"
}
