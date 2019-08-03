resource "aws_iam_policy_attachment" "sms_policy_attachment" {
  name       = "${var.environment}-sms-attachment"
  roles      = ["${aws_iam_role.sms_iam_role.name}"]
  policy_arn = "${aws_iam_policy.sms_policy.arn}"
}
