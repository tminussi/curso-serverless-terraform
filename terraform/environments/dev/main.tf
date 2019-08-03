data "aws_caller_identity" "current" {}

module "users" {
  source         = "../../infra/users"
  environment    = "${var.environment}"
  write_capacity = 1
  read_capacity  = 1
  jwt_secret     = "${var.jwt_secret}"
  admin_id       = "${var.admin_id}"
  admin_email    = "${var.admin_email}"
  admin_password = "${var.admin_password}"
  admin_name     = "${var.admin_name}"
}

module "bookings" {
  source                = "../../infra/bookings"
  environment           = "${var.environment}"
  write_capacity        = 1
  read_capacity         = 1
  sns_notifications_arn = "${module.notifications.notifications_topic_arn}"
}
module "notifications" {
  source      = "../../infra/notifications"
  environment = "${var.environment}"
  account_id  = "${data.aws_caller_identity.current.account_id}"
  region      = "${var.region}"
}

module "system" {
  source               = "../../infra/system"
  environment          = "${var.environment}"
  email_from           = "${var.email_from}"
  email_from_password  = "${var.email_from_password}"
  email_to             = "${var.email_to}"
  smtp_server          = "${var.smtp_server}"
  sms_phone_from       = "${var.sms_phone_from}"
  sms_phone_to         = "${var.sms_phone_to}"
  message_bird_api_key = "${var.message_bird_api_key}"
}

