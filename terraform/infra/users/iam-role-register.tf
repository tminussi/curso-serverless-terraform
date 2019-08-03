resource "aws_iam_role" "register_iam_role" {
  name = "${var.environment}-register-iam-role"

  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "register_iam_role" {
  name  = "${var.environment}-register-iam-role"
  type  = "String"
  value = "${aws_iam_role.register_iam_role.arn}"

}

