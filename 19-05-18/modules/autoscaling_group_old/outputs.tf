output launch_config_name {
  value = "${aws_launch_configuration.launch_config.name}"
}

output launch_config_id {
  value = "${aws_launch_configuration.launch_config.id}"
}

output asg_name {
  value = "${aws_autoscaling_group.asg.name}"
}

output asg_id {
  value = "${aws_autoscaling_group.asg.id}"
}