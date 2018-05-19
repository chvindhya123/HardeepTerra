variable "name" {
  description = "Name of the service being provisioned"
}

variable "vpc_subnets" {
  description = "Marcus VPC subnet id numbers"
  type = "list"
}

variable "ami_id" {
  description = "Marcus AMI ID number used to build these instances"
}

variable "marcus_function" {
  description = "Value of the Function tag for all resources associated with this autoscaling group"
}

variable "marcus_keepter" {
  description = "Value of the Keeper tag for all resources associate with this autoscaling group"
}

variable "cluster_size" {
  description = "Number of servers to launch"
}

variable "cluster_name" {
  description = "Name of the autoscaling group, must be unique for each autoscaling group in an account (if there are multiple"
}

variable "instance_type" {
  description = "Instance type for servers in the autoscaling group"
  default = "t2.medium"
}

variable "instance_profile" {
  description = "AWS IAM host role for autoscaling group"
}

variable "cluster_ec2_tag" {
  description = "Name of the EC2 tag used to identify cluster members"
}

variable "ssh_key_name" {
  description = "Name of the SSH keypair used for EC2 instance access"
}
variable "storage_type" {
  description = "Type of storage to attach to EC2 instances: standard, gp2, io1"
  default = "gp2"
}

variable "storage_size" {
  description = "Size of the storage to attach to EC2 instnaces (in gigabytes)"
  default = "50"
}

variable "storage_iops" {
  description = "Amount of provisioned IOPS (must be set if volume_type is io1)"
  default = 0
}

variable "storage_kill" {
  description = "If true, instance storage will be deleted upon instance termination"
  default = true
}

variable "storage_optimized" {
  description = "If true, instance will run on EBS optimized stack"
  default = false
}

variable "security_groups" {
  description = "List of security groups to apply to instances"
  type = "list"
}

variable "target_group_arns" {
  description = "List of load balancer target group ARNs to attach the asg to"
  type = "list"
  default = []
}