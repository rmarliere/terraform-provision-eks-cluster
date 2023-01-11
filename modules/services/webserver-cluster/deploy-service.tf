resource "kubernetes_service" "springpet" {
  # depends_on = [module.eks]
  metadata {
    name = "springpet"
  }

  spec {
    port {
      port        = 8080
      target_port = 8080
    }

    selector = {
      app = "springpet"
    }

    type = "ClusterIP"
  }
}