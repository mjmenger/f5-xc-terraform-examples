resource "helm_release" "nginx-plus-ingress" {
    name = "nginx-ic-nap-dos/nginx-plus-ingress"
    repository = "https://helm.nginx.com/stable"
    chart = "nginx-plus-ingress"
    namespace = kubernetes_namespace.nginx-ingress.metadata[0].name
    values = [file("./charts/nginx-plus-ingress/values.yaml")]

    depends_on = [
      kubernetes_secret.docker-registry
    ]
}