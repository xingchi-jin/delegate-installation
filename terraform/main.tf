resource "helm_release" "delegate" {
  name             = var.delegate_name
  repository       = "https://app.harness.io/storage/harness-download/harness-helm-charts/"
  chart            = "harness-delegate-ng"
  namespace        = var.namespace
  create_namespace = true

  values = [data.utils_deep_merge_yaml.values.output]
}

locals {
  values = yamlencode({
    accountId       = var.account_id,
    delegateToken   = var.delegate_token,
    managerEndpoint = var.manager_endpoint,
    namespace       = var.namespace,
    delegateName    = var.delegate_name,
    dockerImage     = var.delegate_image,
    proxyUser       = var.proxy_user,
    proxyPassword   = var.proxy_password
  })
}


data "utils_deep_merge_yaml" "values" {
  input = compact([
    local.values,
    var.irsa_enabled ? data.utils_deep_merge_yaml.irsa[0].output : "",
    var.values
  ])
}

data "utils_deep_merge_yaml" "irsa" {
  count = var.irsa_enabled ? 1 : 0
  input = compact([
    yamlencode({
      serviceAccount : {
        annotations : {
          "eks.amazonaws.com/role-arn" : var.irsa_role_arn,
        }
      }
    })
  ])
}

output "values" {
  value = data.utils_deep_merge_yaml.values.output
  // sensitive = false
}
