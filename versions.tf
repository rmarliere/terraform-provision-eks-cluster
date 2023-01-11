terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }

  required_version = "1.3.6"

    backend "s3" {

    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    bucket         = "terraform-marliere"
    key            = "test/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "table-rmarliere"
    encrypt        = true

  }
}

