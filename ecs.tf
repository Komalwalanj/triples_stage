resource "aws_ecs_cluster" "cluster" {
 name = lower("${var.application}-${var.environment}-ecs")
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
   tags = local.tags

}

module "triples-helper" {
             
  source              = "git::https://git.syngentaaws.org/terraform-modules/securitygroup.git?ref=master"
  security_group_name = "helper"
  vpc_id              =  var.vpc_id

#######################################
#ingress rule for triples helper stage#
#######################################
  ingress_rules = [

     {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Application TCP connection"
      display-name = "Ingress Rules"
      from_port   = 8501
      to_port     = 8501
      protocol    = "TCP"

    },

    {
     cidr_blocks = ["10.112.84.0/23"]
      description = "SSH from MALZ USE1 bastion"
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
    },

    {
  
      cidr_blocks = ["10.63.162.0/23"]
      description = "SSH from MALZ EUC1 bastion"
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
    },
  
      
  {
     cidr_blocks = ["10.112.84.0/23"]
      description = "RDP from MALZ USE1 bastion"
      from_port   = 3389
      to_port     = 3389
      protocol    = "TCP"
    },
    
  {
     cidr_blocks = ["10.63.162.0/23"]
      description = "RDP from MALZ EUC1 bastion" 
      from_port   = 3389
      to_port     = 3389
      protocol    = "TCP"
    },
  ]

  egress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "All protocols outbound rule"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"

    },
    
  ]

  tags = merge(
    {
      "Name" = "${var.application}-${var.environment}-custom-SG"
    },
 
  local.tags

   )
}



#####################
 # triples-web #
######################
module "triples-web" {
  source              = "git::https://git.syngentaaws.org/terraform-modules/securitygroup.git?ref=master"
  security_group_name = "web"
  vpc_id              = var.vpc_id

  ingress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "triples-api"
      from_port   = 80
      to_port     = 80
      protocol    = "TCP"
    },

  ]

  egress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "All protocols outbound rule"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    },
    
  ]

 	tags = merge(
    {
      "Name" = "${var.application}-${var.environment}-custom-SG"
    },
 
  local.tags

   )
}
#####################
 # triples-api #
######################
module "triples-api" {
  source              = "git::https://git.syngentaaws.org/terraform-modules/securitygroup.git?ref=master"
  security_group_name = "api"
  vpc_id              = var.vpc_id

  ingress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "triples-api"
      from_port   = 8080
      to_port     = 8080
      protocol    = "TCP"
    },

  ]

  egress_rules = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "All protocols outbound rule"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
    },
    
  ]

 	tags = merge(
    {
      "Name" = "${var.application}-${var.environment}-custom-SG"
    },
 
  local.tags

   )
}