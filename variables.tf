variable "env" {
  description = "Environment name"
}

variable "cms_publish_topic" {
  description = "The arn of the SNS topic to where the events are published"
  type        = "string"
}

variable "cms_name" {
  description = "The name of the CMS creating the infrastructure"
  type        = "string"
}

variable "event_subscription_queue_name" {
  description = "The name of the Queue to subscribe new events"
  type        = "string"
}

variable "fifoQueue" {
  description = "Boolean designating a FIFO queue. If not set, it defaults to false making it standard."
  default     = false
}
