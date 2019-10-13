resource "kubernetes_namespace" "istio" {
  metadata {
    name = "istio-system"
  }
}

resource "kubernetes_namespace" "go_apis" {
  metadata {
    name = "go-apis"
  }
}
