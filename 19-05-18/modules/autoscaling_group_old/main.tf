resource "aws_launch_configuration" "launch_config" {
  name = "${var.name}"
  image_id = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  iam_instance_profile = "${var.instance_profile}"
  key_name = "${var.ssh_key_name}"
  security_groups = ["${var.security_groups}"]
  placement_tenancy = "default"
  associate_public_ip_address = false
  ebs_optimized = "${var.storage_optimized}"
  root_block_device {
    volume_type = "${var.storage_type}"
    volume_size = "${var.storage_size}"
    iops = "${var.storage_iops}"
    delete_on_termination = "${var.storage_kill}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  launch_configuration = "${aws_launch_configuration.launch_config.name}"
  name = "sftp-${var.cluster_name}"
  vpc_zone_identifier = ["${var.vpc_subnets}"]
  min_size = "${var.cluster_size}"
  max_size = "${var.cluster_size}"
  desired_capacity = "${var.cluster_size}"
  termination_policies = ["OldestLaunchConfiguration", "OldestInstance"]
  force_delete = true
  health_check_type = "EC2"
  health_check_grace_period = 900
  target_group_arns = ["${var.target_group_arns}"]
  tag {
    key = "Name"
    value = "${var.name} (AUTO)"
    propagate_at_launch = true
  }
  tag {
    key = "Function"
    value = "${var.marcus_function}"
    propagate_at_launch = true
  }
  tag {
    key = "Keeper"
    value = "${var.marcus_keepter}"
    propagate_at_launch = true
  }
  tag {
    key = "${var.cluster_ec2_tag}"
    value = "${var.cluster_name}"
    propagate_at_launch = true
  }
}