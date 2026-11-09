variable "vpc_id" {
}
variable "subnets" {
type = list(string)
}
variable "ami_id" {
}
variable "instance_type" {
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
variable "userdata" {
default = "#!/bin/bash\nyum install -y python3\n"
}
