resource "aws_s3_bucket" "bucket" {
  bucket = "${var.name}"
  region = "${var.aws_region}"
  acl = "private"
  versioning {
    enabled = "${var.versioning}"
  }

  server_side_encryption_configuration {
    "rule" {
      "apply_server_side_encryption_by_default" {
        sse_algorithm = "AES256"
      }
    }
  }
}

//data "template_file" "s3_bucket_policy" {
//  template = "${file("../policy-templates/${var.bucket_policy_template}")}"
//  vars = {
//    instance_role_arn = "${var.instance_role_arn}"
//    s3_bucket_arn = "${aws_s3_bucket.bucket.arn}"
//  }
//}
//
//resource "aws_s3_bucket_policy" "bucket_policy" {
//  bucket = "${aws_s3_bucket.bucket.id}"
//  policy = "${data.template_file.s3_bucket_policy.rendered}"
//}