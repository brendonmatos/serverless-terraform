variable "code_folder" {
    type = string
}

variable "aws_bucket_id" {
    type = string
}

variable "aws_role_arn" {
    type = string
}

variable "aws_lambda_name" {
  type = string
}

variable "aws_runtime" {
    default = "nodejs12.x"
    type = string
}

variable "function_handler" {
    default = "main.handler"
    type = string
}

variable "env" {
  type = map(string)
}
