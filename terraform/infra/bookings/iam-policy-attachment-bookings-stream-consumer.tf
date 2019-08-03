resource "aws_iam_policy_attachment" "bookings_stream_consumer_policy_attachment" {
  name       = "${var.environment}-bookings-stream-consumer-attachment"
  roles      = ["${aws_iam_role.bookings_stream_consumer_iam_role.name}"]
  policy_arn = "${aws_iam_policy.bookings_stream_consumer_policy.arn}"
}
