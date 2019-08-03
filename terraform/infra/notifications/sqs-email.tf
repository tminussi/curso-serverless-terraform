resource "aws_sqs_queue" "email" {
  name           = "${var.environment}-email-queue"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.email_dlq.arn}\",\"maxReceiveCount\":3}"
  policy = templatefile("${path.module}/templates/sqs-sns-policy.tpl",
    {
      resource   = "arn:aws:sqs:${var.region}:${var.account_id}:${var.environment}-email-queue"
      source_arn = "${aws_sns_topic.notifications.arn}"
  })
}

resource "aws_ssm_parameter" "email-sqs" {
  name  = "${var.environment}-email-sqs"
  type  = "String"
  value = "${aws_sqs_queue.email.arn}"
}


resource "aws_sqs_queue" "email_dlq" {
  name = "${var.environment}-email-queue-dlq"
}

