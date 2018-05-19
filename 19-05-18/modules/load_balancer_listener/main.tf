resource "aws_lb_listener" "listener" {
  load_balancer_arn = "${var.lb_arn}"
  port = "${var.port}"
  protocol = "${var.protocol}"
  default_action {
    target_group_arn = "${var.lbtg_arn}"
    type = "forward"
  }
}