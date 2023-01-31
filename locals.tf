locals {
  terraform = {
    additional_properties = ""
    key                   = "Project"
    value                 = "TECDCN-2495"
  }
  organization = data.intersight_organization_organization.default.results[0].moid
}