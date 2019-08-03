resource "aws_iam_policy_attachment" "login_policy_attachment" {
  name       = "${var.environment}-login-attachment"
  roles      = ["${aws_iam_role.login_iam_role.name}"]
  policy_arn = "${aws_iam_policy.login_policy.arn}"
}
