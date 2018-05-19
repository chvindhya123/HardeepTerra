output sg_id {
  value = "${data.aws_security_group.sg.id}"
}

output sg_name {
  value = "${data.aws_security_group.sg.name}"
}