resource "aws_dynamodb_table" "bookings" {
  name     = "${var.environment}-bookings"
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }
  write_capacity   = "${var.write_capacity}"
  read_capacity    = "${var.read_capacity}"
  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"
}

resource "aws_ssm_parameter" "dynamodb_bookings_table" {
  name  = "${var.environment}-dynamodb-bookings-table"
  type  = "String"
  value = "${aws_dynamodb_table.bookings.name}"
}

resource "aws_ssm_parameter" "dynamodb_bookings_stream" {
  name  = "${var.environment}-dynamodb-bookings-stream"
  type  = "String"
  value = "${aws_dynamodb_table.bookings.stream_arn}"
}
