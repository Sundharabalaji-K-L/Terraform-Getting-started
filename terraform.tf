terraform {
  required_version = ">=1.0, <=2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }

}
