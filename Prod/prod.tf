provider "aws" {
  region = "us-east-2"
}

resource "aws_appmesh_mesh" "prod_mesh" {
  name = "prod-mesh"
}

resource "aws_athena_database" "prod_analytics" {
  name   = "prod_analytics_db"
  bucket = "ordinaryjoe-prod-athena-logs"
}

resource "aws_wafv2_web_acl" "prod_waf" {
  name        = "prod-waf-acl"
  scope       = "REGIONAL"
  description = "Web ACL for prod environment"

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

    visibility_config {
      sampled_requests_enabled = true
      cloudwatch_metrics_enabled = true
      metric_name = "SQLInjectionRuleMetric"
    }
  }

  visibility_config {
    sampled_requests_enabled = true
    cloudwatch_metrics_enabled = true
    metric_name = "prod-waf-acl-metric"
  }
}
