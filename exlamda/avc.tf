provider "aws" {
  region = "your-aws-region"
}

resource "aws_lambda_function" "example" {
  function_name = "example_lambda_function"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "your_lambda_function_handler"  # Update with your actual handler function

  runtime = "python3.8"

  filename = "${path.module}/your_python_file.py"  # Update with your actual Python file

  source_code_hash = filebase64sha256("${path.module}/your_python_file.py")  # Update with your actual Python file

  environment {
    variables = {
      key1 = "value1",
      key2 = "value2",
    }
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_execution_role.name
}
