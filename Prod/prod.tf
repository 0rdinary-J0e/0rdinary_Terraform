provider "aws" {
  region = "us-west-2"
}

resource "aws_appmesh_mesh" "prod_mesh" {
  name = "prod-mesh"
}

resource "aws_athena_database" "prod_analytics" {
  name   = "prod_analytics_db"
  bucket = "s3://prod-athena-logs/"
}

resource "aws_waf_web_acl" "prod_waf" {
  name        = "prod-waf-acl"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "SQLInjectionRule"
    priority = 1

    action {
      block {}
    }

    statement {
      sqli_match_statement {
        field_to_match {
          query_string {}
        }
        text_transformation {
          priority = 0
          type     = "URL_DECODE"
        }
      }
    }
  }
}
