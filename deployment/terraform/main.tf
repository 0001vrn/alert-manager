locals {
  kafka_endpoint =  "${var.kafka_hostname}:${var.kafka_port}"
}

# ========================================
# Alert Manager
# ========================================

module "alert-manager-service" {
  source = "alert-manager-service"

  # Docker
  image = "${var.alert-manager-service["image"]}"
  image_pull_policy = "${var.alert-manager-service["image_pull_policy"]}"

  # Kubernetes
  namespace = "${var.app_namespace}"
  enabled = "${var.alert-manager-service["enabled"]}"
  replicas = "${var.alert-manager-service["instances"]}"
  cpu_limit = "${var.alert-manager-service["cpu_limit"]}"
  cpu_request = "${var.alert-manager-service["cpu_request"]}"
  memory_limit = "${var.alert-manager-service["memory_limit"]}"
  memory_request = "${var.alert-manager-service["memory_request"]}"
  node_selector_label = "${var.node_selector_label}"
  kubectl_executable_name = "${var.kubectl_executable_name}"
  kubectl_context_name = "${var.kubectl_context_name}"

  # Environment
  jvm_memory_limit = "${var.alert-manager-service["jvm_memory_limit"]}"
  graphite_hostname = "${var.graphite_hostname}"
  graphite_port = "${var.graphite_port}"
  graphite_enabled = "${var.graphite_enabled}"
  graphite_prefix = "${var.graphite_prefix}"
  env_vars = "${var.alert-manager-service["environment_overrides"]}"

  # App
  kafka_endpoint = "${local.kafka_endpoint}"
  additional_email_validator_expression = "${var.alert-manager-service["additional_email_validator_expression"]}"
  subscription_es_urls = "${var.alert-manager-service["subscription_es_urls"]}"
  subscription_es_config_vars_json = "${var.alert-manager-service["subscription_es_config_vars_json"]}"
  alert_store_es_urls = "${var.alert-manager-service["alert_store_es_urls"]}"
  alert_store_es_config_vars_json = "${var.alert-manager-service["alert_store_es_config_vars_json"]}"
}

module "alert-manager-store" {
  source = "alert-manager-store"

  # Docker
  image = "${var.alert-manager-store["image"]}"
  image_pull_policy = "${var.alert-manager-store["image_pull_policy"]}"

  # Kubernetes
  namespace = "${var.app_namespace}"
  enabled = "${var.alert-manager-store["enabled"]}"
  replicas = "${var.alert-manager-store["instances"]}"
  cpu_limit = "${var.alert-manager-store["cpu_limit"]}"
  cpu_request = "${var.alert-manager-store["cpu_request"]}"
  memory_limit = "${var.alert-manager-store["memory_limit"]}"
  memory_request = "${var.alert-manager-store["memory_request"]}"
  node_selector_label = "${var.node_selector_label}"
  kubectl_executable_name = "${var.kubectl_executable_name}"
  kubectl_context_name = "${var.kubectl_context_name}"

  # Environment
  jvm_memory_limit = "${var.alert-manager-store["jvm_memory_limit"]}"
  graphite_hostname = "${var.graphite_hostname}"
  graphite_port = "${var.graphite_port}"
  graphite_enabled = "${var.graphite_enabled}"
  graphite_prefix = "${var.graphite_prefix}"
  env_vars = "${var.alert-manager-store["environment_overrides"]}"

  # App
  kafka_endpoint = "${local.kafka_endpoint}"
  alert_store_es_urls = "${var.alert-manager-store["alert_store_es_urls"]}"
  alert_store_es_config_vars_json = "${var.alert-manager-store["alert_store_es_config_vars_json"]}"
}

module "alert-manager-notifier" {
  source = "alert-manager-notifier"

  # Docker
  image = "${var.alert-manager-notifier["image"]}"
  image_pull_policy = "${var.alert-manager-notifier["image_pull_policy"]}"

  # Kubernetes
  namespace = "${var.app_namespace}"
  enabled = "${var.alert-manager-notifier["enabled"]}"
  replicas = "${var.alert-manager-notifier["instances"]}"
  cpu_limit = "${var.alert-manager-notifier["cpu_limit"]}"
  cpu_request = "${var.alert-manager-notifier["cpu_request"]}"
  memory_limit = "${var.alert-manager-notifier["memory_limit"]}"
  memory_request = "${var.alert-manager-notifier["memory_request"]}"
  node_selector_label = "${var.node_selector_label}"
  kubectl_executable_name = "${var.kubectl_executable_name}"
  kubectl_context_name = "${var.kubectl_context_name}"

  # Environment
  jvm_memory_limit = "${var.alert-manager-notifier["jvm_memory_limit"]}"
  graphite_hostname = "${var.graphite_hostname}"
  graphite_port = "${var.graphite_port}"
  graphite_enabled = "${var.graphite_enabled}"
  graphite_prefix = "${var.graphite_prefix}"
  env_vars = "${var.alert-manager-notifier["environment_overrides"]}"

  # App
  kafka_endpoint = "${local.kafka_endpoint}"
  subscription_search_url = "${var.alert-manager-notifier["subscription_search_url"]}"
  mail_from = "${var.alert-manager-notifier["mail_from"]}"
  alert_rate_limit_enabled = "${var.alert-manager-notifier["alert_rate_limit_enabled"]}"
  alert_rate_limit_value = "${var.alert-manager-notifier["alert_rate_limit_value"]}"
  alert_expiry_time_in_sec = "${var.alert-manager-notifier["alert_expiry_time_in_sec"]}"
  alert_store_es_urls = "${var.alert-manager-notifier["alert_store_es_urls"]}"
  alert_store_es_config_vars_json = "${var.alert-manager-notifier["alert_store_es_config_vars_json"]}"
}
