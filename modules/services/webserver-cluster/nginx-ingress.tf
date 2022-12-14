module "nginx-controller" {
  # depends_on = [module.eks]
  source = "terraform-iaac/nginx-controller/helm"

  additional_set = [
    {
      name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
      value = "nlb"
      type  = "string"
    },
    {
      name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"
      value = "true"
      type  = "string"
    }
  ]
}

resource "kubernetes_ingress_v1" "rails_ingress" {
  depends_on = [module.nginx-controller]
  metadata {
    name      = "rails-ingress"
    namespace = "default"

    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "springpet"

              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}

