 ##################################################################
# Internal Network Load Balancer < Target - ALB >
##################################################################
module "nlb" {
 
  source             = "git::https://git.syngentaaws.org/terraform-modules/alb.git/?ref=master"
  internal           = true
  load_balancer_type = "network"
  vpc_id             = var.vpc_id
  subnets            = var.subnet_ids
  lb_custom_name     = "80"

  
    https_listeners = [ 
    {
      port               = "443"
      protocol           = "TLS"
      certificate_arn    = "arn:aws:acm:eu-central-1:517826409102:certificate/27ea2e73-f68b-487e-a0ca-77c291e57283"
      target_group_index = 0
    },
     
  ]

  target_groups = [
    {
    
      backend_protocol     = "TCP"
      backend_port         = "80"
      target_type          = "ip"
  
    },

  ]
 
  tags = local.tags
  }
#####################################################################
# Internal Network Load Balancer < Target - ALB >
##################################################################### 
module "nlb_helper" {
  source             = "git::https://git.syngentaaws.org/terraform-modules/alb.git/?ref=master"
  internal           = true
  load_balancer_type = "network"
  vpc_id             = var.vpc_id
  subnets            = var.subnet_ids
  lb_custom_name     = "8501"
 

    https_listeners = [

    {
      port               = "443"
      protocol           = "TLS"
      certificate_arn    = "arn:aws:acm:eu-central-1:517826409102:certificate/4060ad6c-deca-4d2b-a913-f1be42e4cdbc"
      target_group_index  = 0
    },
    ]
    
    
    target_groups = [
      {
    
      backend_protocol     = "TCP"
      backend_port         = "8501"
      target_type          = "ip"
  
    },
    ]
     tags = local.tags
  }