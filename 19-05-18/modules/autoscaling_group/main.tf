resource "aws_launch_configuration" "launch_config" {
  name_prefix = "${var.vars["tier"]}-LC-"
  image_id = "${var.vars["ami"]}"
  instance_type = "${var.vars["type"]}"
  key_name = "${var.vars["key_pair"]}"
  security_groups = ["${var.security_groups}"]
  placement_tenancy = "default"
#  associate_public_ip_address = false
  root_block_device {
      volume_type = "${var.vars["root_vol_type"]}"
      volume_size  = "${var.vars["root_vol_size"]}"
    delete_on_termination = "${var.storage_kill}"
  }
  ebs_block_device {
    device_name = "/dev/sdg"
    volume_size = "${var.vars["data_vol_size"]}" 
    volume_type = "${var.vars["data_vol_type"]}"
    delete_on_termination = "${var.storage_kill}"
  }  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name_prefix = "${var.vars["tier"]}-ASG-"
  launch_configuration = "${aws_launch_configuration.launch_config.name}"
  vpc_zone_identifier = "${var.vpc_subnets}"
  target_group_arns = ["${var.target_group_arns}"]
  desired_capacity = "${var.vars["asg_cur"]}"
  max_size = "${var.vars["asg_max"]}"
  min_size = "${var.vars["asg_min"]}"
  termination_policies = ["OldestLaunchConfiguration", "OldestInstance"]
#  force_delete = true
#  health_check_type = "EC2"
#  health_check_grace_period = 900

}