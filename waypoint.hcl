project = "testing_egheegfi"

app "testing_egheegfi" {
  build {
    use "pack" {
      builder     = "heroku/buildpacks:20"
    }
    registry {
      use "docker" {
        image = "868771833856.dkr.ecr.ap-northeast-2.amazonaws.com/testing_egheegfi"
        tag   = var.image_tag
      }
    }
  }
  deploy {
    use "docker" {
    }
  }
}

variable "image_tag" {
  type    = string
  default = "latest"
}

