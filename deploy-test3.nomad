job testing_egheegfi_test3 {

  datacenters = ["dc1"]

  group "quick-launcher" {
    count = 1
    network {
      mode = "bridge"
      port "http" {
        static = 20561
        to = 5000
      }
    }

    service {
      name = "demo-quicklauncher"
      port = "http"

      connect {
        sidecar_service {}
      }

      check {
        type     = "http"
        path     = "/"
        interval = "2s"
        timeout  = "2s"
      }
    }

    task "server" {
      driver = "docker"

      config {
        image = var.image
        ports = ["http"]
      }
      resources {
        cpu    = 250
        memory = 512
      }
    }
  }
}

variable "image" {
    type = string
}

