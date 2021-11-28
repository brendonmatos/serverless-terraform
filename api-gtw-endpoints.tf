module "aws_lambda_endpoint" {
  source = "./modules/aws-lambda-endpoint"

  aws_bucket_id                 = aws_s3_bucket.lambda_bucket.id
  aws_api_gateway_execution_arn = aws_apigatewayv2_api.this.execution_arn
  aws_api_gateway_id            = aws_apigatewayv2_api.this.id

  for_each     = { for endpoint in var.endpoints : endpoint.path => endpoint }
  aws_role_arn = coalesce(each.value.iam_role_arn, aws_iam_role.lambda_exec.arn)

  aws_lambda_name  = each.value.name
  http_path        = each.value.path
  http_method      = each.value.method
  function_handler = each.value.handler
  aws_runtime      = each.value.runtime
  code_folder      = each.value.code
  env              = each.value.env
}