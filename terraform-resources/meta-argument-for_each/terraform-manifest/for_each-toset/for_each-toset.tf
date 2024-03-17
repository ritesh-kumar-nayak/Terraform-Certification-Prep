resource "aws_s3_bucket" "buckets-for-environment" {
  for_each = toset(["dev-app-001", "qa-app-002", "stage-app-003", "prod-app-004"])
  bucket   = each.key
  tags = {
    "BucketName" = each.key
  }

}

# Creating IAM user using for_each toset

resource "aws_iam_user" "iam-by-terraform" {
  for_each = toset(["RJack", "RRob", "RAmar"])
  name     = each.key
}

# Output of the region used for Bucket creation
output "selected_regions" {
  value = { for key, bucket in aws_s3_bucket.buckets-for-environment : key => bucket.region }
}

# In for_each set each.key = each.value, there is no concept of each.value actually.
# Even if we use each.value it will give the same name .