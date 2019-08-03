resource "aws_iam_policy_attachment" "create_booking_policy_attachment" {
  name       = "${var.environment}-create-booking-attachment"
  roles      = ["${aws_iam_role.create_booking_iam_role.name}"]
  policy_arn = "${aws_iam_policy.create_booking_policy.arn}"
}
