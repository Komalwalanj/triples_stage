module "kms" {
  source                   = "git::https://git.syngentaaws.org/terraform-modules/KMS.git/?ref=master"
  description              = "${var.application}-${var.environment}-kms"
  alias                    = "Triples_stage_key"
  
    tags = merge(
    {
      "Name" = "${var.application}-${var.environment}-kms"
    },
    local.tags
  )
}
