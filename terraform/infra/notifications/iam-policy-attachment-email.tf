resource "aws_iam_policy_attachment" "email_policy_attachment" {
  name       = "${var.environment}-email-attachment"
  roles      = ["${aws_iam_role.email_iam_role.name}"]
  policy_arn = "${aws_iam_policy.email_policy.arn}"
}
