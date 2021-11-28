data "archive_file" "this" {
  type = "zip"
  source_dir  = "${var.code_folder}"
  output_path = "${var.code_folder}.zip"
}

resource "aws_s3_bucket_object" "this" {
  bucket = var.aws_bucket_id
  key    = "${var.aws_lambda_name}.zip"
  source = data.archive_file.this.output_path
  etag = filemd5(data.archive_file.this.output_path)
}


locals {
  environment_map = var.variables == null ? [] : [var.variables]
}

resource "aws_lambda_function" "this" {
  function_name = var.aws_lambda_name
  s3_bucket = var.aws_bucket_id
  s3_key    = aws_s3_bucket_object.this.key
  runtime = var.aws_runtime
  handler = var.function_handler
  source_code_hash = data.archive_file.this.output_base64sha256
  role = var.aws_role_arn
  dynamic "environment" {
    for_each = local.environment_map
    content {
      variables = environment.value
    }
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name = "/aws/lambda/${var.aws_lambda_name}"

  retention_in_days = 1
}
