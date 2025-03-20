provider "aws" {
  region = var.aws_region
}

resource "aws_elasticache_subnet_group" "private_subnet_3_group" {
  name = "private-subnet-3-group"
  subnet_ids = [aws_subnet.private_subnet_3.id]
  
}

resource "aws_elasticache_cluster" "uat_redis" {
  cluster_id       = "uat-redis-cluster"
  engine           = "redis"
  node_type        = "cache.t3.micro"
  num_cache_nodes  = 1
  subnet_group_name = aws_elasticache_subnet_group.private_subnet_3_group.name
  security_group_ids = [aws_security_group.ordinaryjoe_app_web_sg.id]
}

resource "aws_iam_role" "sfn_role" {
  name = "sfn_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "states.amazonaws.com"
        }
      }
    ]
  })
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
