# ECOMMERCE DEV CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "ecommerce_dev" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.ecommerce_dev_frontend.bucket_regional_domain_name
    origin_id   = "ecommerce-dev-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.ecommerce-dev-env.cname
    origin_id   = "ecommerce-dev-backend"
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
    target_origin_id       = "ecommerce-dev-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "ecommerce-dev-backend"
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
    Stage = "DEV"
  }
}

# CATALOGUE DEV CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "catalogue_dev" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.catalogue_dev_frontend.bucket_regional_domain_name
    origin_id   = "catalogue-dev-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.catalogue-dev-env.cname
    origin_id   = "catalogue-dev-backend"
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
    target_origin_id       = "catalogue-dev-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "catalogue-dev-backend"
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
    Stage = "DEV"
  }
}

# CORE DEV CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "core_dev" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.core_dev_frontend.bucket_regional_domain_name
    origin_id   = "core-dev-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.core-dev-env.cname
    origin_id   = "core-dev-backend"
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
    target_origin_id       = "core-dev-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "core-dev-backend"
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
    Stage = "DEV"
  }
}

# ANALYTICS DEV CLOUDFRONT DISTRIBUTION
resource "aws_cloudfront_distribution" "analytics_dev" {
  provider = aws.admin_1

  origin {
    domain_name = aws_s3_bucket.analytics_dev_frontend.bucket_regional_domain_name
    origin_id   = "analytics-dev-s3"
  }

  origin {
    domain_name = aws_elastic_beanstalk_environment.analytics-dev-env.cname
    origin_id   = "analytics-dev-backend"
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
    target_origin_id       = "analytics-dev-s3"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
  }

  ordered_cache_behavior {
    path_pattern           = "/api/*"
    target_origin_id       = "analytics-dev-backend"
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
    Stage = "DEV"
  }
}
