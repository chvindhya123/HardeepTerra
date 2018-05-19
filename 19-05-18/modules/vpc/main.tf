data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = ["*${var.vpc_search_string}*"]
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.vpc.id}"
  tags = {
//    "Name" = "priv-*"
    "Name" = "private*"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.vpc.id}"
  tags = {
//    "Name" = "pub-*"
    "Name" = "public*"
  }
}