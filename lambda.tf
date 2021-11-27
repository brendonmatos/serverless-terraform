resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = "${var.application_id}_aws_lambdas"
  acl           = "private"
  force_destroy = true
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.application_id}_iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
