provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "demo-eks-cluster"
  subnet_ids         = ["subnet-05b44bfd1b4116bef", "subnet-0249c87e84709e37d", "subnet-0e577330874ecd2c6"] 
  cluster_version = "1.26"
  cluster_endpoint_public_access = true
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }
  eks_managed_node_groups = {
    one = {
      name = "node-group-1"
      instance_types = ["t3.small"]
      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"
      instance_types = ["t3.small"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}


data "aws_eks_cluster" "example" {
  name = "demo-eks-cluster"
}

data "aws_eks_cluster_auth" "example" {
  name = "demo-eks-cluster"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.example.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.example.token
}

# resource "kubernetes_namespace" "nginx" {
#   provider = kubernetes.eks_cluster
#   metadata {
#     name = "nginx-namespace"
#   }
# }

# resource "kubernetes_deployment" "nginx" {
#   provider = kubernetes.eks_cluster
#   metadata {
#     name      = "nginx-deployment"
#     namespace = kubernetes_namespace.nginx.metadata[0].name
#   }

#   spec {
#     replicas = 1

#     selector {
#       match_labels = {
#         app = "nginx"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "nginx"
#         }
#       }

#       spec {
#         container {
#           name  = "nginx"
#           image = "nginx:latest"
#         }
#       }
#     }
#   }
# }