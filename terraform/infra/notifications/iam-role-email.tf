resource "aws_iam_role" "email_iam_role" {
  name = "${var.environment}-email-iam-role"

  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "email_iam_role" {
  name  = "${var.environment}-email-iam-role"
  type  = "String"
  value = "${aws_iam_role.email_iam_role.arn}"

}

