terraform {
  required_version = ">= 1.2.4"

  required_providers {
    elasticstack = {
      source  = "elastic/elasticstack"
      version = "~> 0.3.3"
    }
  }
}
