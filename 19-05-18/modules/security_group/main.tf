resource "aws_security_group" "security_group" {
  name = "${var.vars["short"]}_${var.com}_SG"
  description = "Security Group for ${var.vars["stack"]} Search Head Cluster ${var.com}"
  vpc_id = "${var.vars["vpc_id"]}"
#  count = "${var.sg_count}"
  tags {
    Name = "${var.vars["short"]}_${var.com}_SG"
    Stack = "${var.vars["stack"]}"
    Tier = "${var.vars["tier"]}"
  }  
}