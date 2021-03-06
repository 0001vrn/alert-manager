variable "kubectl_context_name" {}
variable "kafka_hostname" {}
variable "kafka_port" {}
variable "graphite_hostname" {}
variable "graphite_port" {}
variable "graphite_enabled" {}
variable "graphite_prefix" {
  default = "stats.gauges."
}
variable "kubectl_executable_name" {}
variable "app_namespace" {}
variable "node_selector_label"{}

variable "alert-manager-service" {
  type = "map"
}

variable "alert-manager-notifier" {
  type = "map"
}

variable "alert-manager-store" {
  type = "map"
}

