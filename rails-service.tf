resource "kubernetes_service" "railsapp" {
  depends_on = [module.eks]
  metadata {
    name = "railsapp"
  }

  spec {
    port {
      port        = 3000
      target_port = 3000
    }

    selector = {
      app = "railsapp"
    }

    type = "ClusterIP"
  }
}

