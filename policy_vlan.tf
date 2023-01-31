resource "intersight_fabric_eth_network_policy" "vmware-vlans" {
  name = "vmware-vlans"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
  dynamic "profiles" {
    for_each = intersight_fabric_switch_profile.default-6454
    content {
      moid        = profiles.value.moid
      object_type = profiles.value.object_type
    }
  }
}

resource "intersight_fabric_vlan" "vlans_infra" {
  for_each = var.network_map_infra

  name = each.key
  tags = [local.terraform]


  auto_allow_on_uplinks = true
  is_native             = false
  vlan_id               = each.value.vlan

  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.vmware-vlans.moid
  }

  multicast_policy {
    moid = intersight_fabric_multicast_policy.default.moid
  }
}


resource "intersight_fabric_vlan" "vlans_vmmnetwork" {
  for_each = var.network_map_vmmnetwork

  name = each.key
  tags = [local.terraform]

  auto_allow_on_uplinks = true
  is_native             = false
  vlan_id               = each.value.vlan

  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.vmware-vlans.moid
  }

  multicast_policy {
    moid = intersight_fabric_multicast_policy.default.moid
  }

}