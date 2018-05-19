
variable "vpc_subnets" { description = "Marcus VPC subnet id numbers"
  type = "list"}

variable "security_groups" { description = "List of security groups to apply to instances"
  type = "list"}

variable "target_group_arns" { description = "List of load balancer target group ARNs to attach the asg to"
  type = "list"
  default = []}
  
variable "vars" {type="map" default = {       
   data_vol_type = "gp2" 
   data_vol_size = "0"
}}
variable "storage_kill" {default = true}