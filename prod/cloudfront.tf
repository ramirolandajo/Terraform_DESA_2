# ECOMMERCE PROD CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "ecommerce_prod" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.ecommerce_prod_frontend.bucket_regional_domain_name
    origin_id   = "ecommerce-prod-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.ecommerce-prod-env.cname
    origin_id   = "ecommerce-prod-backend"
    custom_origin_config {
      origin_protocol_policy = "http-only"
      http_port              = 80
      https_port = 443
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "ecommerce-prod-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "ecommerce-prod-backend"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD"]
  }

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    App   = "ecommerce"
    Stage = "PROD"
  }
}

# CATALOGUE PROD CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "catalogue_prod" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.catalogue_prod_frontend.bucket_regional_domain_name
    origin_id   = "catalogue-prod-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.catalogue-prod-env.cname
    origin_id   = "catalogue-prod-backend"
    custom_origin_config {
      origin_protocol_policy = "http-only"
      http_port              = 80
      https_port = 443
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "catalogue-prod-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "catalogue-prod-backend"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD"]
  }

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    App   = "catalogue"
    Stage = "PROD"
  }
}

# CORE PROD CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "core_prod" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.core_prod_frontend.bucket_regional_domain_name
    origin_id   = "core-prod-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.core-prod-env.cname
    origin_id   = "core-prod-backend"
    custom_origin_config {
      origin_protocol_policy = "http-only"
      http_port              = 80
      https_port = 443
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "core-prod-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "core-prod-backend"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD"]
  }

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    App   = "core"
    Stage = "PROD"
  }
}

# ANALYTICS PROD CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "analytics_prod" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.analytics_prod_frontend.bucket_regional_domain_name
    origin_id   = "analytics-prod-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.analytics-prod-env.cname
    origin_id   = "analytics-prod-backend"
    custom_origin_config {
      origin_protocol_policy = "http-only"
      http_port              = 80
      https_port = 443
      origin_ssl_protocols = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "analytics-prod-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "analytics-prod-backend"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD"]
  }

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    App   = "analytics"
    Stage = "PROD"
  }
}
