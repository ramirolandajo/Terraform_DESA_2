locals {
  bucket_name = coalesce(var.bucket_name, lower(join("-", compact([
    var.project,
    var.environment,
    var.module_name,
    "frontend"
  ]))))
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name

  tags = merge(
    {
      "Project"     = var.project
      "Environment" = var.environment
      "Component"   = var.module_name
      "ManagedBy"   = "terraform"
    },
    var.tags
  )
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "Access identity for ${local.bucket_name}"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.this.iam_arn
        }
        Action   = ["s3:GetObject"]
        Resource = [
          "${aws_s3_bucket.this.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = true
  aliases             = var.aliases
  default_root_object = var.default_root_object

  origin {
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
    origin_id   = "s3-${local.bucket_name}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-${local.bucket_name}"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.certificate_arn
    ssl_support_method             = var.certificate_arn == null ? null : "sni-only"
    minimum_protocol_version       = var.certificate_arn == null ? null : "TLSv1.2_2021"
    cloudfront_default_certificate = var.certificate_arn == null
  }

  tags = merge(
    {
      "Project"     = var.project
      "Environment" = var.environment
      "Component"   = var.module_name
      "ManagedBy"   = "terraform"
    },
    var.tags
  )
}

output "bucket_id" {
  description = "ID of the created S3 bucket."
  value       = aws_s3_bucket.this.id
}

output "distribution_id" {
  description = "ID of the CloudFront distribution."
  value       = aws_cloudfront_distribution.this.id
}

output "distribution_domain_name" {
  description = "Domain name of the CloudFront distribution."
  value       = aws_cloudfront_distribution.this.domain_name
}
