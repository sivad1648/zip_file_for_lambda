import pathlib{ 
resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  path          = "/home/ubuntu/jenkins/workspace/Lambda_deploy_via_terraform"
  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.8"

}
}