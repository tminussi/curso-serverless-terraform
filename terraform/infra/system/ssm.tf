resource "aws_ssm_parameter" "email_from" {
  name  = "${var.environment}-email-from"
  type  = "String"
  value = "${var.email_from}"
}

resource "aws_ssm_parameter" "email_from_password" {
  name  = "${var.environment}-email-from-password"
  type  = "String"
  value = "${var.email_from_password}"
}

resource "aws_ssm_parameter" "email_to" {
  name  = "${var.environment}-email-to"
  type  = "String"
  value = "${var.email_to}"
}

resource "aws_ssm_parameter" "smtp_server" {
  name  = "${var.environment}-smtp-server"
  type  = "String"
  value = "${var.smtp_server}"
}

resource "aws_ssm_parameter" "message-bird-api-key" {
  name  = "${var.environment}-message-bird-api-key"
  type  = "String"
  value = "${var.message_bird_api_key}"
}

resource "aws_ssm_parameter" "sms-phone-from" {
  name  = "${var.environment}-sms-phone-from"
  type  = "String"
  value = "${var.sms_phone_from}"
}

resource "aws_ssm_parameter" "sms-phone-to" {
  name  = "${var.environment}-sms-phone-to"
  type  = "String"
  value = "${var.sms_phone_to}"
}
