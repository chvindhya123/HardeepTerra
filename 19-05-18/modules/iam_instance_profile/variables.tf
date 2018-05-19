variable "name" {
  description = "Name of the service being provisioned"
}

variable "service" {
  description = "Name of the service with which the name is associated"
}

variable "function" {
  description = "What funciton is the role involved in"
  default = "server"
}

variable "profile" {
  description = "Name of the profile json file to use for creating the instance profile"
}