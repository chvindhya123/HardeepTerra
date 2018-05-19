resource "aws_lb_target_group" "lbtg" {
  name = "${var.name}"
  port = "${var.port}"
  protocol = "${var.protocol}"
  vpc_id = "${var.vpc_id}"
}