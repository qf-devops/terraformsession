provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  subnets         = ["subnet-05b44bfd1b4116bef", "subnet-0249c87e84709e37d", "subnet-0e577330874ecd2c6"] 
  cluster_version = "1.26"
}

provider "kubernetes" {
  alias  = "eks_cluster"
  host   = module.eks.cluster_endpoint
  token  = module.eks.cluster_token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority[0].data)
}

resource "kubernetes_namespace" "nginx" {
  provider = kubernetes.eks_cluster
  metadata {
    name = "nginx-namespace"
  }
}

resource "kubernetes_deployment" "nginx" {
  provider = kubernetes.eks_cluster
  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.nginx.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
        }
      }
    }
  }
}