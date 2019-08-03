resource "aws_sns_topic" "notifications" {
  name = "${var.environment}-notifications"
}

resource "aws_ssm_parameter" "notifications_topic" {
  name  = "${var.environment}-notification-topic"
  type  = "String"
  value = "${aws_sns_topic.notifications.arn}"
}

output "notifications_topic_arn" {
  value = "${aws_sns_topic.notifications.arn}"
}


