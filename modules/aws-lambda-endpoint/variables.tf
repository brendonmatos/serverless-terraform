
variable "aws_api_gateway_execution_arn" {
  type = string
}

variable "aws_lambda_name" {
  type = string
}

variable "aws_api_gateway_id" {
  type = string
}

variable "http_method" {
  type    = string
  default = "GET"
}

variable "http_path" {
  type = string
}

variable "code_folder" {
  type = string
}

variable "aws_bucket_id" {
  type = string
}

variable "aws_role_arn" {
  type = string
}

variable "function_handler" {
  type = string
}
