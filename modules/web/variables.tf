variable "ami_id" {
type = string
}
variable "instance_type" {
type = string
}
variable "vpc_id" {
type = string 
}
variable "subnets" {
type = list(string)
}
variable "alb_subnets" {
type = list(string)
}
variable "desired_capacity" {
}
variable "max_size" {
}
variable "min_size" {
}
variable "sg_ids" {
type = list(string)
}
variable "alb_sg_id" {
}
variable "user_data" {
default = "#!/bin/bash\nyum install -y httpd\nsystemctl start httpd\n"
}
