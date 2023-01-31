variable "network_map_infra" {
  type = map(object({
    vlan = number
    qos  = string
  }))
  default = {
    inband_vmware = {
      vlan = 840
      qos  = "silver"
    }
    inband_ucs = {
      vlan = 840
      qos  = "silver"
    }
  }
}


variable "network_map_vmmnetwork" {
  type = map(object({
    vlan = number
    qos  = string
  }))
  default = {
    app_vlan_842 = {
      vlan = 842
      qos  = "silver"
    }
    app_vlan_843 = {
      vlan = 843
      qos = "silver"
    }
    app_vlan_844 = {
      vlan = 844
      qos = "silver"
    }
  }
}