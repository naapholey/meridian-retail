variable "project_name" {
  type = string
}

variable "ecr_lifecycle_policy" {
  default = <<EOF
  {
    rules: [{
        "rulePriority": 1,
            "description": "Keep only the last 30 images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 30
            },
            "action": {
                "type": "expire"
            }
    }]
  }
  EOF
}