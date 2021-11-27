output "aws_lambda_invoke_arn" {
  value = aws_lambda_function.this.invoke_arn
}

output "aws_lambda_name" {
  value = aws_lambda_function.this.function_name
}