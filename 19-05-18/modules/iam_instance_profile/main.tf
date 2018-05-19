resource "aws_iam_role" "instance_role" {
  name = "${var.name}-server"
  description = "IAM Role for ${var.service}-${var.function}"
  force_detach_policies = true
  path = "/"
  assume_role_policy = "${file("../policies/ec2_assume_role_policy.json")}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "instance_role_policy" {
  name = "${var.name}-server"
  role = "${aws_iam_role.instance_role.id}"
  policy = "${file("../policies/${var.profile}")}"
//  policy = "${file("../policies/sftp_instance_profile.json")}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${aws_iam_role.instance_role.name}"
  role = "${aws_iam_role.instance_role.name}"
  lifecycle {
    create_before_destroy = true
  }
}