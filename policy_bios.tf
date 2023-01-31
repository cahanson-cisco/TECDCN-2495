resource "intersight_bios_policy" "virtualization" {
  name = "virtualization"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  ## Customizations
  # https://www.cisco.com/c/en/us/products/collateral/servers-unified-computing/ucs-b-series-blade-servers/performance-tuning-guide-ucs-m6-servers.html
  
  cpu_perf_enhancement                  = "Auto"
  processor_c1e                         = "enabled"
  processor_c6report                    = "enabled"
  energy_efficient_turbo                = "enabled"

}