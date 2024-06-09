locals {
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
    environment  = var.environment
  }
  s3_bucket_name = "${lower(local.naming_prefix)}-${random_integer.s3.result}"
  website_content = {
    website = "/website/index.html"
    logo    = "/website/golbo_logo_vert.png"
  }
  naming_prefix = var.naming_prefix

}

resource "random_integer" "s3" {
  min = 1000
  max = 99999
}

