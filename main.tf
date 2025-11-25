# The bootstrap module is essentially a data source for all of the identifiers being imported.
module "bootstrap" {
  source = "git::https://github.com/craigsloggett-lab/terraform-tfe-bootstrap?ref=v0.11.0"
}
