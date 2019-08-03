resource "aws_iam_role" "list_bookings_iam_role" {
  name = "${var.environment}-list-bookings-iam-role"

  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "list_bookings_iam_role" {
  name  = "${var.environment}-list-bookings-iam-role"
  type  = "String"
  value = "${aws_iam_role.list_bookings_iam_role.arn}"

}

