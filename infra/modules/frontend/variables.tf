variable "bucket_name" {
  type = string
}

variable "distribution_comment" {
  type    = string
  default = ""
}

variable "default_root_object" {
  type    = string
  default = "index.html"
}
