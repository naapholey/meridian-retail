resource "aws_ecr_repository" "auth" {
  name = "${var.project_name}-auth-ecr"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "${var.project_name}-auth-ecr"
    Environment = "production"
  }
}

resource "aws_ecr_repository" "orders" {
  name = "${var.project_name}-orders-ecr"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "${var.project_name}-orders-ecr"
    Environment = "production"
  }
}

resource "aws_ecr_repository" "catalog" {
  name = "${var.project_name}-catalog-ecr"
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "IMMUTABLE"

  tags = {
    Name = "${var.project_name}-catalog-ecr"
    Environment = "production"
  }
}

resource "aws_ecr_repository" "frontend" {
  name = "${var.project_name}-frontend-ecr"
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "IMMUTABLE"
  tags = {
    Name = "${var.project_name}-frontend-ecr"
    Environment = "production"
  }
}

resource "aws_ecr_lifecycle_policy" "auth" {
  repository = aws_ecr_repository.auth.name
  policy = var.ecr_lifecycle_policy
}
resource "aws_ecr_lifecycle_policy" "orders" {
  repository = aws_ecr_repository.orders.name
  policy = var.ecr_lifecycle_policy
}
resource "aws_ecr_lifecycle_policy" "frontend" {
  repository = aws_ecr_repository.frontend.name
  policy = var.ecr_lifecycle_policy
}
resource "aws_ecr_lifecycle_policy" "catalog" {
  repository = aws_ecr_repository.catalog.name
  policy = var.ecr_lifecycle_policy
}