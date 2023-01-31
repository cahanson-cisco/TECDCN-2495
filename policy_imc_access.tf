resource "intersight_access_policy" "inband_imc" {
  name = "inband_imc"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  configuration_type {
    configure_inband      = true
    configure_out_of_band = false
  }

  inband_vlan = var.network_map_infra["inband_ucs"].vlan

  inband_ip_pool {
    moid = intersight_ippool_pool.ip_pools["inband_ucs"].id
  }
}