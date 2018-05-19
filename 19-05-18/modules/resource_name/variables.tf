variable "aws_region" {
  description = "Target AWS region"
}

variable "env" {
  description = "Target Environment name, such as prod, test, etc"
}

variable "service" {
  description = "Name of the service with which the name is associated"
}

variable "count" {
  description = "Ordinal number to add to the name to facilitate uniqueness, 0 to suppress"
  default = 0
}