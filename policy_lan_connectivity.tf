resource "intersight_vnic_lan_connectivity_policy" "esxi" {
  name = "esxi"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  placement_mode  = "custom"
  target_platform = "FIAttached"
}

resource "intersight_vnic_eth_if" "mgmt_a" {
  name = "mgmt_a"
  tags = [local.terraform]

  order            = 0
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.esxi_fab_a.moid
  }

  placement {
    switch_id = "A"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.esxi_mgmt.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["silver"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.esxi.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.esxi.moid
  }
}

resource "intersight_vnic_eth_if" "mgmt_b" {
  name = "mgmt_b"
  tags = [local.terraform]

  order            = 1
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.esxi_fab_b.moid
  }

  placement {
    switch_id = "B"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.esxi_mgmt.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["silver"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.esxi.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.esxi.moid
  }
}


resource "intersight_vnic_eth_if" "vmm_a" {
  name = "vmm_a"
  tags = [local.terraform]

  order            = 2
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.esxi_fab_a.moid
  }

  placement {
    switch_id = "A"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.all.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["silver"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.esxi.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.esxi.moid
  }
}

resource "intersight_vnic_eth_if" "vmm_b" {
  name = "vmm_b"
  tags = [local.terraform]

  order            = 3
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.esxi_fab_b.moid
  }

  placement {
    switch_id = "B"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.all.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["silver"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.esxi.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.esxi.moid
  }
}


resource "intersight_vnic_eth_if" "new_vnic_a" {
  name = "new_vnic_a"
  tags = [local.terraform]

  order            = 4
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.esxi_fab_a.moid
  }

  placement {
    switch_id = "A"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.all.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["silver"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.esxi.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.esxi.moid
  }
}

resource "intersight_vnic_eth_if" "new_vnic_b" {
  name = "new_vnic_b"
  tags = [local.terraform]

  order            = 5
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.esxi_fab_b.moid
  }

  placement {
    switch_id = "B"
    id = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.all.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["silver"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.esxi.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.esxi.moid
  }
}