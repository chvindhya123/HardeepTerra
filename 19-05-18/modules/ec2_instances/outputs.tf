output instance_ids {
  value = "${aws_instance.instance.*.id}"
}

output ip_addresses {
  value = "${aws_instance.instance.*.private_ip}"
}