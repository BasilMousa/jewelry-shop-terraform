// Include all resource files

// Provider and backend
// ...existing code...

module "s3_dynamodb" {
	source              = "./modules/s3_dynamodb"
	s3_bucket_name      = "jewelry-shop-basil-terraform"
	dynamodb_table_name = "jewelry-shop-lock-table-basil"
}

module "vpc" {
	source                     = "./modules/vpc"
	vpc_cidr                   = var.vpc_cidr
	vpc_name                   = "jewelry-shop-vpc"
	public_subnet_cidr         = var.public_subnet_cidr
	public_subnet_name         = "jewelry-shop-public-subnet"
	private_subnet_cidrs       = var.private_subnet_cidrs
	private_subnet_name_prefix = "jewelry-shop-private-subnet"
	igw_name                   = "jewelry-shop-igw"
	public_route_table_name    = "jewelry-shop-public-rt"
}

module "security_groups" {
	source           = "./modules/security_groups"
	vpc_id           = module.vpc.vpc_id
	elb_sg_name      = "jewelry-shop-elb-sg"
	ec2_sg_name      = "jewelry-shop-ec2-sg"
	ansible_sg_name  = "jewelry-shop-ansible-sg"
}

module "ec2" {
	source                  = "./modules/ec2"
	app_server_count        = 2
	ec2_instance_type       = var.ec2_instance_type
	private_subnet_ids      = module.vpc.private_subnet_ids
	public_subnet_id        = module.vpc.public_subnet_id
	ec2_sg_id               = module.security_groups.ec2_sg_id
	ansible_sg_id           = module.security_groups.ansible_sg_id
	key_name                = var.key_name
	app_server_name_prefix  = "jewelry-shop-app-server"
	ansible_host_name       = "jewelry-shop-ansible-host"
}

module "elb" {
	source              = "./modules/elb"
	elb_name            = "jewelry-shop-elb"
	public_subnet_ids   = [module.vpc.public_subnet_id]
	elb_sg_id           = module.security_groups.elb_sg_id
	target_group_name   = "jewelry-shop-tg"
	vpc_id              = module.vpc.vpc_id
	app_server_ids      = module.ec2.app_server_ids
}

// Outputs
// ...existing code...
