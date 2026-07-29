module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 5.0"
  
  cluster_name = var.ambiente

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }
}

resource "aws_ecs_task_definition" "django-api" {
  family = "django-api"
  requires_compatibilities = [ "FARGATE" ]
  network_mode = "awsvpc"
  cpu = 256
  memory = 512
  execution_role_arn = aws_iam_role.cargo.arn
  container_definitions = jsonencode([
    {
      name      = "producao"
      image     = "899957567480.dkr.ecr.us-west-2.amazonaws.com/producao:v1"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ]
    }
  ])
}
