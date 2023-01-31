resource "intersight_bulk_mo_cloner" "profiles" {
  for_each = toset(formatlist("%s", range(1, 5 + 1)))

  sources {
    object_type = intersight_server_profile_template.tecdcn-esxi.object_type
    moid        = intersight_server_profile_template.tecdcn-esxi.moid
  }
  targets {
    object_type = "server.Profile"
    additional_properties = jsonencode({
      Name = format("tecdcn-esxi-%02s", each.key)
    })
  }
  lifecycle {
    ignore_changes = all # This is required for this resource type
  }
}
