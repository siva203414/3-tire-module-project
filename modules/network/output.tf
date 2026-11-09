output "vpc_id" {
value = aws_vpc.myvpc.id
}
output "public_subnet_ids" {
value = aws_subnet.public[*].id
}
output "private_subnet_ids" {
value = aws_subnet.private[*].id
}
output "web_sg_id" {
value = aws_security_group.web.id
}
output "webalb_sg_id" {
value = aws_security_group.web-albsg.id
}
output "app_sg_id" {
value = aws_security_group.app.id
}
output "db_sg_id" {
value = aws_security_group.db.id
}
output "private_db_subnets" {
  value = aws_subnet.private[*].id
}
