data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "my_lambda" {
  function_name    = "my_lambda_function"
  runtime          = "python3.8"
  handler          = "lambda_function.lambda_handler"
  timeout          = 10
  memory_size      = 128

  filename         = "lambda_function.zip"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  role = aws_iam_role.lambda_execution_role.arn

  environment {
    variables = {
      KEY1 = "VALUE1"
      KEY2 = "VALUE2"
    }
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
