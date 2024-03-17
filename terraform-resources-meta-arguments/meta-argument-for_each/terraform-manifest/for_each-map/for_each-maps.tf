# Use Case: Using for_each maps we'll create multiple S3 buckets based on environments like dev, QA, stage, prod

resource "aws_s3_bucket" "buckets-for-environments" {


  # for_each Meta Argument here
  for_each = {
    "dev"   = "app-0001"
    "qa"    = "app-002"
    "stage" = "app-003"
    "prod"  = "app-004"
  }
  bucket = "${each.key}-${each.value}"


  tags = {
    "environment" = each.key
    "eachvalue"   = each.value
    "bucketname"  = "${each.key}-${each.value}"
  }

}