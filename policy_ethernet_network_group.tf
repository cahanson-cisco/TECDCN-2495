resource "intersight_fabric_eth_network_group_policy" "esxi_mgmt" {
  name = "esxi_mgmt"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  vlan_settings {
    native_vlan   = var.network_map_infra["inband_vmware"].vlan
    allowed_vlans = var.network_map_infra["inband_vmware"].vlan
  }
}


resource "intersight_fabric_eth_network_group_policy" "all" {
  name = "all"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  vlan_settings {
    native_vlan = 1
    allowed_vlans = format("%s", join(",", [for e in var.network_map_vmmnetwork : e.vlan]))
  }
}