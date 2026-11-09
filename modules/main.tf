module "network" {
source = "./network"
vpc_cidr = var.vpc_cidr_m
public_subnets = var.public_subnets_m
private_subnets = var.private_subnets_m
azs = var.azs_m
}
module "web" {
  source = "./web"
  vpc_id = module.network.vpc_id
  subnets = module.network.public_subnet_ids
  alb_subnets = module.network.public_subnet_ids
  instance_type = var.web_instance_type_m
  ami_id = var.web_ami_id_m
  desired_capacity = 2 
  max_size = 4
  min_size = 2
  sg_ids = [module.network.web_sg_id]
  alb_sg_id = module.network.webalb_sg_id
}
module "app" {
  source = "./app"
  vpc_id = module.network.vpc_id
  subnets = module.network.private_subnet_ids
  instance_type = var.web_instance_type_m
  ami_id = var.web_ami_id_m
  desired_capacity = 2
  max_size = 4
  min_size = 2
  sg_ids = [module.network.app_sg_id]
}
module "db" {
  source = "./db"
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.private_db_subnets
  db_username = var.db_username_m
  db_password = var.db_password_m
  db_name = var.db_name_m
  sg_ids = [module.network.db_sg_id]
  }

