# ECOMMERCE PROD BUCKET
resource "aws_s3_bucket" "ecommerce_prod_frontend" {
  provider = aws.admin_1
  bucket   = "ecommerce-prod-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "PROD"
    App   = "ecommerce"
  }
}

resource "aws_s3_bucket_ownership_controls" "ecommerce_prod" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.ecommerce_prod_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "ecommerce_prod" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.ecommerce_prod_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "ecommerce_prod" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.ecommerce_prod_frontend.id
  versioning_configuration { status = "Enabled" }
}

# CATALOGUE PROD BUCKET
resource "aws_s3_bucket" "catalogue_prod_frontend" {
  provider = aws.admin_1
  bucket   = "catalogue-prod-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "PROD"
    App   = "catalogue"
  }
}

resource "aws_s3_bucket_ownership_controls" "catalogue_prod" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.catalogue_prod_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "catalogue_prod" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.catalogue_prod_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "catalogue_prod" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.catalogue_prod_frontend.id
  versioning_configuration { status = "Enabled" }
}

# CORE PROD BUCKET
resource "aws_s3_bucket" "core_prod_frontend" {
  provider = aws.admin_1
  bucket   = "core-prod-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "PROD"
    App   = "core"
  }
}

resource "aws_s3_bucket_ownership_controls" "core_prod" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.core_prod_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "core_prod" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.core_prod_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "core_prod" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.core_prod_frontend.id
  versioning_configuration { status = "Enabled" }
}

# ANALYTICS PROD BUCKET
resource "aws_s3_bucket" "analytics_prod_frontend" {
  provider = aws.admin_1
  bucket   = "analytics-prod-frontend-bucket"
  tags = {
    Type  = "Frontend Bucket"
    Stage = "PROD"
    App   = "analytics"
  }
}

resource "aws_s3_bucket_ownership_controls" "analytics_prod" {
  provider = aws.admin_1
  bucket   = aws_s3_bucket.analytics_prod_frontend.id
  rule { object_ownership = "BucketOwnerEnforced" }
}

resource "aws_s3_bucket_public_access_block" "analytics_prod" {
  provider = aws.admin_1
  bucket                  = aws_s3_bucket.analytics_prod_frontend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "analytics_prod" {
  provider = aws.admin_1
  bucket = aws_s3_bucket.analytics_prod_frontend.id
  versioning_configuration { status = "Enabled" }
}
