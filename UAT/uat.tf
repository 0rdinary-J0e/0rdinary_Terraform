provider "aws" {
  region = "us-east-1"
}

resource "aws_elasticache_cluster" "uat_redis" {
  cluster_id       = "uat-redis-cluster"
  engine           = "redis"
  node_type        = "cache.t3.micro"
  num_cache_nodes  = 1
}

resource "aws_sfn_state_machine" "uat_workflow" {
  name     = "uat-test-workflow"
  role_arn = aws_iam_role.sfn_role.arn
  definition = <<EOF
  {
    "Comment": "UAT Workflow",
    "StartAt": "Start",
    "States": {
      "Start": {
        "Type": "Pass",
        "Next": "Success"
      },
      "Success": {
        "Type": "Succeed"
      }
    }
  }
  EOF
}
