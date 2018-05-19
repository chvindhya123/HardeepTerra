output "instance_role_id" {
  value = "${aws_iam_role.instance_role.id}"
}

output "instance_policy_id" {
  value = "${aws_iam_role_policy.instance_role_policy.id}"
}

output "instance_role_arn" {
  value = "${aws_iam_role.instance_role.arn}"
}

output "instance_profile" {
  value = "${aws_iam_instance_profile.instance_profile.name}"
}