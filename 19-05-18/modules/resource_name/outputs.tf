output "name" {
  value = "${var.env}-${substr(var.aws_region, 0, 7)}-${var.service}${var.count > 0 ? format("-%02d", var.count) : ""}"
}