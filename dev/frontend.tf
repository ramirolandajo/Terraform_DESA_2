# ECOMMERCE DEV BUCKET
resource "aws_s3_bucket" "ecommerce_dev_frontend" {
  provider = aws.admin_1
  bucket   = "ecommerce-dev-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "DEV"
    App   = "ecommerce"
  }
}

resource "aws_s3_bucket_ownership_controls" "ecommerce_dev" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.ecommerce_dev_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "ecommerce_dev" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.ecommerce_dev_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "ecommerce_dev" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.ecommerce_dev_frontend.id
  versioning_configuration { status = "Enabled" }
}

# CATALOGUE DEV BUCKET
resource "aws_s3_bucket" "catalogue_dev_frontend" {
  provider = aws.admin_1
  bucket   = "catalogue-dev-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "DEV"
    App   = "catalogue"
  }
}

resource "aws_s3_bucket_ownership_controls" "catalogue_dev" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.catalogue_dev_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "catalogue_dev" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.catalogue_dev_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "catalogue_dev" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.catalogue_dev_frontend.id
  versioning_configuration { status = "Enabled" }
}

# CORE DEV BUCKET
resource "aws_s3_bucket" "core_dev_frontend" {
  provider = aws.admin_1
  bucket   = "core-dev-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "DEV"
    App   = "core"
  }
}

resource "aws_s3_bucket_ownership_controls" "core_dev" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.core_dev_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "core_dev" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.core_dev_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "core_dev" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.core_dev_frontend.id
  versioning_configuration { status = "Enabled" }
}

# ANALYTICS DEV BUCKET
resource "aws_s3_bucket" "analytics_dev_frontend" {
  provider = aws.admin_1
  bucket   = "analytics-dev-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "DEV"
    App   = "analytics"
  }
}

resource "aws_s3_bucket_ownership_controls" "analytics_dev" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.analytics_dev_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "analytics_dev" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.analytics_dev_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "analytics_dev" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.analytics_dev_frontend.id
  versioning_configuration { status = "Enabled" }
}
