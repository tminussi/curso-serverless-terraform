resource "aws_iam_role" "login_iam_role" {
  name = "${var.environment}-login-iam-role"

  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "login_iam_role" {
  name  = "${var.environment}-login-iam-role"
  type  = "String"
  value = "${aws_iam_role.login_iam_role.arn}"

}

