resource "kubernetes_service" "railsapp" {
  metadata {
    name = "railsapp"
  }

  spec {
    port {
      port        = 3000
      target_port = "3000"
    }

    selector = {
      app = "railsapp"
    }

    type = "LoadBalancer"
  }
}

