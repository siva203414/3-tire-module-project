variable "vpc_cidr_m" {
}
variable "public_subnets_m" {
type = list(string)
}
variable "private_subnets_m" {
type = list(string)
}
variable "azs_m" {
type = list(string)
}
variable "web_ami_id_m" {
}
variable "web_instance_type_m" {
default = "t3.micro"
}
variable "app_ami_id_m" {
}
variable "app_instance_type_m" {
default = "t3.micro"
}
variable "db_username_m" {
}
variable "db_password_m" {
sensitive = true
}
variable "db_name_m" {
}
variable "db_instance_class_m" {
default = "db.t3.micro"
}
