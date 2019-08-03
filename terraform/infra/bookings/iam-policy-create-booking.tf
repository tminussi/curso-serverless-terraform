resource "aws_iam_policy" "create_booking_policy" {
  name = "${var.environment}-create-booking-policy"

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    action    = "dynamodb:PutItem",
    resource  = "${aws_dynamodb_table.bookings.arn}",
    sns_topic = ""
  })
}
