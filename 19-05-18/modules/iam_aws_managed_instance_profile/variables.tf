variable "name" {
  description = "Name of the service being provisioned"
}

variable "function" {
  description = "What function is the role involved in"
  default = "server"
}

variable "aws_policy" {
  description = "Name of the aws managed policy to use for creating the instance profile"
}

variable "assume_policy" {
  description = "Name of the assume policy json file"
}