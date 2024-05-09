resource "random_pet" "s3_bucket_name" {
    length = 3
    separator = "-"  
}

resource "aws_s3_bucket" "bucket_for_statefile" {

    bucket = random_pet.s3_bucket_name.id
    
    #region = "us-east-1"
  
}