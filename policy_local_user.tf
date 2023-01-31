resource "intersight_iam_end_point_user_policy" "default" {
  name = "default"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  password_properties {
    enforce_strong_password  = true
    enable_password_expiry   = false
    force_send_password      = true
    password_expiry_duration = 1
    password_history         = 0
    notification_period      = 0
    grace_period             = 0
  }
}


resource "random_password" "example_password" {
  length  = 16
  special = false
}


resource "intersight_iam_end_point_user" "admin" {
  name = "admin"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }
}

data "intersight_iam_end_point_role" "imc_admin" {
  name      = "admin"
  role_type = "endpoint-admin"
  type      = "IMC"
}

resource "intersight_iam_end_point_user_role" "admin" {
  tags = [local.terraform]

  enabled  = true
  password = var.imc_local_admin_password

  end_point_user {
    moid = intersight_iam_end_point_user.admin.moid
  }

  end_point_user_policy {
    moid = intersight_iam_end_point_user_policy.default.moid
  }

  end_point_role {
    moid = data.intersight_iam_end_point_role.imc_admin.results[0].moid
  }

}