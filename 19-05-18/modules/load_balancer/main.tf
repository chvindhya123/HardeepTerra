resource "aws_lb" "elb" {
  name               = "${var.name}"
  internal           = "${var.internal}"
  load_balancer_type = "${var.lb_type}"
  subnets            = ["${var.subnet_ids}"]
  security_groups    = ["${var.security_groups_ids}"]


  tags {
    Name = "${var.name}"
    Stack = "${var.stack}"
    Tier = "${var.tier}"
  }
}
