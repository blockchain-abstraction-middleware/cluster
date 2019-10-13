# data "helm_repository" "istio-release" {
#   name = "istio-release"
#   url  = "https://storage.googleapis.com/istio-release/releases/1.3.2/charts/"
# }

#   url  = "https://storage.googleapis.com//releases"

# resource "helm_release" "istio-release" {
#   name       = "istio-release"
#   repository = "${data.helm_repository.istio-release.metadata.0.name}"
#   chart      = "istio"
#   version    = "1.3.2"

#   values = [
#     "${file("charts.yaml")}"
#   ]

#   set {
#     name  = "cluster.enabled"
#     value = "true"
#   }

#   set {
#     name  = "metrics.enabled"
#     value = "true"
#   }
# }
