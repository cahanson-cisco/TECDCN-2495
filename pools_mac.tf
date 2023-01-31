resource "intersight_macpool_pool" "esxi_fab_a" {
  name = "esxi_fab_a"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  dynamic "mac_blocks" {
    for_each = formatlist ("%X", range(0,16))
    content {
        from = "00:25:B5:FA:0${mac_blocks.value}:01"
        size = 255
    }
  }
}

resource "intersight_macpool_pool" "esxi_fab_b" {
  name = "esxi_fab_b"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  dynamic "mac_blocks" {
    for_each = formatlist ("%X", range(0,16))
    content {
        from = "00:25:B5:FB:0${mac_blocks.value}:01"
        size = 255
    }
  }
}