data "helm_repository" "istio-release" {
  name = "istio-release"
  url  = "https://storage.googleapis.com/istio-release/releases/1.3.2/charts/"
}

output "istio" {
  value = "${data.helm_repository.istio-release}"
}

resource "helm_release" "istio-release" {
  depends_on = ["null_resource.install_helm"]

  name       = "istio-release"
  namespace  = "istio-system"
  repository = "${data.helm_repository.istio-release.metadata.0.name}"
  chart      = "istio-init"
  version    = "1.3.2"

  set {
    name  = "cluster.enabled"
    value = "true"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }
}

resource "helm_release" "istio-default" {
  depends_on = ["helm_release.istio-release"]

  name       = "istio"
  namespace  = "istio-system"
  repository = "${data.helm_repository.istio-release.metadata.0.name}"
  chart      = "istio"
  version    = "1.3.2"

  set {
    name  = "cluster.enabled"
    value = "true"
  }

  set {
    name  = "metrics.enabled"
    value = "true"
  }
}


