resource "aws_iam_role" role {
  name = "${var.name}-${var.function}}"
  description = "IAM Role for ${var.name}-${var.function}"
  force_detach_policies = true
  path = "/"
  assume_role_policy = "${file("../policies/${var.assume_policy}")}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" attach {
  role = "${aws_iam_role.role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/${var.aws_policy}"
}