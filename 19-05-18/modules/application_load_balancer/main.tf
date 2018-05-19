variable vars { type="map"}
variable subnet_ids {type="list"}
variable security_groups_ids { type="list" default=[]}

resource "aws_lb" "this_alb" {
   name = "${var.vars["tier"]}-ELB"
   internal = false
   load_balancer_type = "${var.vars["lb_type"]}"
   subnets = "${var.subnet_ids}"
   security_groups = ["${var.security_groups_ids}"]
   tags {
     Stack = "${var.vars["stack"]}"
     Tier = "${var.vars["tier"]}"
   }  
}
resource "aws_lb_target_group" "this_tg" {
  name              = "${var.vars["tier"]}-TargetGroup"
  port              = "${var.vars["lb_port"]}"
  protocol          = "${var.vars["lb_protocol"]}"
  vpc_id            = "${var.vars["vpc_id"]}"
}

resource "aws_lb_listener" "this_listener" {
  load_balancer_arn = "${aws_lb.this_alb.arn}"
  port              = "${var.vars["lb_port"]}"
  protocol          = "${var.vars["lb_protocol"]}"
#  ssl_policy       = "ELBSecurityPolicy-2015-05"
#  certificate_arn  = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    target_group_arn = "${aws_lb_target_group.this_tg.arn}"
    type             = "forward"
  }
}

output "tg_arn" {
   value = "${aws_lb_target_group.this_tg.arn}"
}
output "alb_arn" {
   value = "${aws_lb.this_alb.arn}"
}
