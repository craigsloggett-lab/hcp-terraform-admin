# The bootstrap module is the source for all of the identifiers being imported.
module "bootstrap" {
  source = "git::https://github.com/craigsloggett-lab/terraform-tfe-bootstrap?ref=v0.10.2"
}

# The HCP Terraform organization.
import {
  id = module.bootstrap.tfe_organizations.this.name
  to = module.bootstrap.tfe_organization.this
}

# The members of the HCP Terraform organization.
import {
  for_each = module.bootstrap.tfe_organization_memberships

  id = each.key
  to = module.bootstrap.tfe_organization_membership.this[each.key]
}

# The "owners" team.
import {
  id = "${module.bootstrap.tfe_organizations.this.name}/${module.bootstrap.tfe_teams.owners.id}"
  to = module.bootstrap.tfe_team.owners
}

# The members of the "owners" team.
import {
  id = module.bootstrap.tfe_teams.owners.id
  to = module.bootstrap.tfe_team_organization_members.owners
}

# The "Default Project" project.
import {
  id = module.bootstrap.tfe_projects.default.id
  to = module.bootstrap.tfe_project.default
}
