module "iam_emr_role" {
  source = "../iam_aws_managed_role"
  name = "${var.name}"
  function = "emr"
  aws_policy = "AmazonElasticMapReduleRole"
  assume_policy = "emr_assume_role_policy.json"
}

module "iam_emr_ec2_role" {
  source = "../iam_aws_managed_instance_profile"
  name = "${var.name}"
  function = "emr-instance"
  aws_policy = "AmazonElasticMapReduceforEC2Role"
  assume_policy = "ec2_assume_role_policy.json"
}

resource "aws_emr_cluster" emr_cluster {
  name = "${var.name}"
  release_label = "${var.release_label}"
  applications = ["${var.applications}"]

  ec2_attributes {
    key_name = "${var.key_name}"
    subnet_id = "${var.subnet_id}"
    additional_master_security_groups = "${var.add_master_sg}"
    additional_slave_security_groups = "${var.add_slave_sg}"
    instance_profile = "${module.iam_emr_ec2_role.name}"
  }

  ebs_root_volume_size = "${var.ebs_size}"
  autoscaling_role = "${var.as_role}"
  scale_down_behavior = "${var.scale_down_behavior}"
  service_role = "${module.iam_emr_role.name}"
  log_uri = "${var.log_uri}"

  instance_group {
    name = "${var.master_name}"
    instance_count = "${var.master_count}"
    instance_role = "${var.master_role}"
    instance_type = "${var.master_instance_type}"
  }

  instance_group {
    name = "${var.core_name}"
    instance_count = "${var.core_count}"
    instance_role = "${var.core_role}"
    instance_type = "${var.core_instance_type}"
  }

  bootstrap_action {
    name = "${var.bootstrap_name}"
    path = "${var.bootstrap_path}"
    args = "${var.bootstrap_args}"
  }

  configurations = "config.json"

  tags {
    Name = "${var.name}"
    Keeper = "${var.tag_keeper}"
    Function = "${var.tag_function}"
  }
}