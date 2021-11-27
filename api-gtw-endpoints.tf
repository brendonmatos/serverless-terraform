module "aws_lambda_endpoint" {
  source = "./modules/aws-lambda-endpoint"

  aws_bucket_id                 = aws_s3_bucket.lambda_bucket.id
  aws_role_arn                  = aws_iam_role.lambda_exec.arn
  aws_api_gateway_execution_arn = aws_apigatewayv2_api.this.execution_arn
  aws_api_gateway_id            = aws_apigatewayv2_api.this.id

  for_each = { for endpoint in var.endpoints : endpoint.path => endpoint }

  aws_lambda_name = each.value.name
  http_path       = each.value.path
  http_method     = each.value.method
  code_folder     = "${path.module}${each.value.code}"
}