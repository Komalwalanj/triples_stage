# GLOBAL 
##########################
variable "region" {
  description = "Region"
  type        = string
  default     = "eu-central-1"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "eu-central-1a"
}


##########################
# TAGS 
##########################

# Warning : application must have 12 characters maximum regarding target group naming limitations
# Example : applications-stage-int-nlb-22501 must have 32 characters maximum
variable "application" {
  description = "Application Name"
  type        = string
  default     = "triples"
  validation {
    condition     = length(var.application) > 3 && length(var.application) < 12
    error_message = "Application name must have 12 characters maximum"
  }
}

variable "application_code" {
  description   = "Application Code"
  type          = string
  default       = "TSS"
}
variable "environment" {
    description = "Environment Name"
    type        = string
    default     = "Stage"
}
variable "platform" {
    description = "Platform"
    type        = string
    default     = "Linux"
}
variable "business_function" {
    description = "Business Function"
    type        = string
    default     = "Seeds P+S"
}
variable "purpose" {
    description = "Purpose Tag"
    type        = string
    default     = "To track performance and improve seed production"
}
variable "cost_center" {
    description = "Cost Center"
    type        = string
    default     = "FR13FXP501"
}
variable "owner_email" {
    description = "Owner Email Address"
    type        = string
    default     = "carole.capdeville@syngenta.com"
}
variable "contact_email" {
    description = "Contact Email Address"
    type        = string
    default     = "dominique.pothin@syngenta.com"
}
variable "created_by_email" {
    description = "Resource created by"
    type        = string
    default     = "komal.walanj@syngenta.com"
}


##########################
# NETWORK 
##########################
variable "vpc_id" {
  description = "VPC id"
  type        = string
  default     = "vpc-084001a9c172ceb51"
}

variable "subnet_ids" {
  description = "Subnet Ids"
  type        = list
  default     = ["subnet-0032b1268e3d2a8cd", "subnet-082d1791cbb76fa6d"]
}


##########################
# ECR
##########################
variable "aws_caller_identity" {
  description = "caller ID for ECR"
  type        = string
  default     = "769453588195"
}

variable "repository_image_scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (`true`) or not scanned (`false`)"
  type        = bool
  default     = true
}

variable "create_lifecycle_policy" {
  description = "Determines whether a lifecycle policy will be created"
  type        = bool
  default     = false
}
variable "repository_image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`. Defaults to `IMMUTABLE`"
  type        = string
  default     = "IMMUTABLE"
}

##########################
# NLB
##########################
variable "ssl_cert_arn1" {
    description = "ACM certificate arn"
    type        = string
    default     = "arn:aws:acm:eu-central-1:517826409102:certificate/27ea2e73-f68b-487e-a0ca-77c291e57283" 
} 

variable "ssl_cert_arn2" {
    description = "ACM certificate arn"
    type        = string
    default     = "arn:aws:acm:eu-central-1:517826409102:certificate/4060ad6c-deca-4d2b-a913-f1be42e4cdbc" 
}

variable "load_balancer_create_timeout" {
  description = "Timeout value when creating the ALB"
  type        = string
  default     = "10m"
}

###########################
# KMS
###########################
variable "repository_kms_key" {
  description = "The ARN of the KMS key to use when encryption_type is `KMS`. If not specified, uses the default AWS managed key for ECR"
  type        = string
  default     = null
}
