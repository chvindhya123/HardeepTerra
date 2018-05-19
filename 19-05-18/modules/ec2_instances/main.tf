resource "aws_instance" instance {
  count = "${var.num_instances}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_groups}"]
  subnet_id = "${element(var.subnet_ids, count.index)}"
  iam_instance_profile = "${var.iam_instance_profile}"

  tags {
    Name = "${var.instance_name}${count.index}"
    Function = "${var.tag_function}"
    Keeper = "${var.tag_keeper}"
  }

  root_block_device {
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
    delete_on_termination = "${var.delete_on_termination}"
  }
}