resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.aws_lambda_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${var.aws_api_gateway_execution_arn}/*/*"
}

resource "aws_apigatewayv2_integration" "this" {
  api_id = var.aws_api_gateway_id
  integration_uri    = var.aws_lambda_invoke_arn
  integration_type   = "AWS_PROXY"

  /**
    * this integration method is required for AWS_PROXY 
    * integration type when using api gateway v2
    */
  integration_method = "POST" 
}

resource "aws_apigatewayv2_route" "this" {
  api_id = var.aws_api_gateway_id
  route_key = "${var.http_method} ${var.http_path}"
  target    = "integrations/${aws_apigatewayv2_integration.this.id}"
}
