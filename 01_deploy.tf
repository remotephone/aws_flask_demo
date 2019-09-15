provider "aws" {
  profile    = var.profile
  region     = var.region
}


resource "aws_iam_role" "aws_flask_iam_role" {
    name = "aws_flask_iam_role"

    assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
    {
    "Action": "sts:AssumeRole",
    "Principal": {
        "Service": "lambda.amazonaws.com"
    },
    "Effect": "Allow",
    "Sid": ""
    }
]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
    filename      = "app.zip"
    function_name = "flask_test"
    role          = "${aws_iam_role.aws_flask_iam_role.arn}"
    handler       = "app.main"

    # The filebase64sha256() function is available in Terraform 0.11.12 and later
    # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
    # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
    source_code_hash = "${filebase64sha256("app.zip")}"

    runtime = "python3.7"

    environment {
        variables = {
        foo = "bar"
        }
    }
}
