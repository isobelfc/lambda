resource "aws_lambda_function" "lambda" {
  function_name = "${var.lambda_name}-${var.environment}"
  description   = "A simple example lambda"

  s3_bucket         = "isobel-lambda-function-store"
  s3_key            = aws_s3_object.lambda_payload.key

  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"
  timeout       = 15

  runtime = "python3.11"
}