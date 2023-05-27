variable "environment_name" {
  type    = string
  description = "Different Environments"
  default = "UAT"
}

variable "department" {
  type    = string
  description = "Department"
  default = "Finance"
}

variable "deployment_source" {
  type    = string
  description = "Source of deployment"
  default = "Terraform"
}