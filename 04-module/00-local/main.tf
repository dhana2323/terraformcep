module "provider"{
    source = "../../01-aws/00-providers"
    region = var.region
}
module "website_s3_bucket" {
  source = "./s3-static-website"

  bucket_name = "s3-static-website-dhana"
  tags = {
    Terraform   = "true"
  }
}

variable "region"{
    default = "ap-southeast-1"
}
