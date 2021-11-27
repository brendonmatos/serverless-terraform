
module "aws_lambda" {
  source          = "../aws-lambda"
  aws_lambda_name = var.aws_lambda_name
  code_folder     = var.code_folder
  aws_bucket_id   = var.aws_bucket_id
  aws_role_arn    = var.aws_role_arn
  function_handler = var.function_handler
}

module "aws_apigtw_integration" {
  source                        = "../aws-apigtw-lambda"
  aws_lambda_name               = module.aws_lambda.aws_lambda_name
  aws_lambda_invoke_arn         = module.aws_lambda.aws_lambda_invoke_arn
  aws_api_gateway_execution_arn = var.aws_api_gateway_execution_arn
  aws_api_gateway_id            = var.aws_api_gateway_id
  http_path                     = var.http_path
  http_method                   = var.http_method
}
