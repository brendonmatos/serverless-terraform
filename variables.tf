variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "aws_profile" {
  description = "AWS Region"
  type        = string
}

variable "application_name" {
  description = "Application Name"
  type        = string
}

variable "application_id" {
  description = "Application ID"
  type        = string
}

variable "endpoints" {
  description = "Endpoints"
  type = list(object({
    name    = string
    path    = string
    method  = string
    code    = string
    runtime = string
    handler = string
  }))
}