data "aws_ami" ami-latest {
  most_recent = true

  filter {
    name = "name"
    values = ["${var.ami-prefix}"]
  }

  filter {
    name = "state"
    values = ["available"]
  }
}