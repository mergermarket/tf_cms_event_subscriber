Event subscriber terraform module
================================

This modules creates components needed to be able subscribe events from an SQS queue which will subscribe the specified event publisher SNS topic.

When included and configured this module will:
- create an SQS Queue
- subscribe the queue to the provided SNS topic

Module Input Variables
----------------------

See `/variables.tf`.

Usage
-----
```hcl
module "cms_subscriber" {
  source = "github.com/mergermarket/tf_cms_event_subscriber"

  env                           = "aslive"
  event_subscription_queue_name = "cms-subscription-queue-name"
  cms_name                      = "cms"
  cms_publish_topic             = "topic-arn"
}
```

Outputs
-------

See `/outputs.tf`.