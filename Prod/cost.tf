# AWS Budget to monitor monthly spending for EC2
resource "aws_budgets_budget" "ordinaryjoe-prod_app_budget" {
  name              = "AppBudget"
  budget_type       = "COST"
  limit_amount      = "500"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 100.0
    threshold_type      = "PERCENTAGE"
    notification_type   = "ACTUAL"
    # List of subscribers for the notification
    subscriber_email_addresses = ["joseph.n.sweeney@gmail.com"]
  }

  tags = {
    Name = "ordinaryjoe-prod_app_budget"
  }
}


