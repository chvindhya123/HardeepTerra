data "aws_security_group" sg {
  filter {
    name = "group-name"
    values = ["*${var.sg_name}*"]
  }
}