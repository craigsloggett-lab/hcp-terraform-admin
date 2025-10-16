# Public Providers

resource "tfe_registry_provider" "hashicorp" {
  for_each     = toset(["tfe", "azurerm"])
  organization = data.tfe_organization.this.name

  registry_name = "public"
  namespace     = "hashicorp"
  name          = each.key
}

resource "tfe_registry_provider" "microsoft" {
  for_each     = toset(["fabric"])
  organization = data.tfe_organization.this.name

  registry_name = "public"
  namespace     = "microsoft"
  name          = each.key
}
