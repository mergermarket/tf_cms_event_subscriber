data "aws_iam_policy_document" "iam_for_subscription_sqs" {
  statement {
    actions = [
      "SQS:SendMessage",
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = ["${aws_sqs_queue.events.arn}"]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"

      values = [
        "${var.cms_publish_topic}",
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "subscription_queue_policy" {
  queue_url = "${aws_sqs_queue.events.id}"
  policy    = "${data.aws_iam_policy_document.iam_for_subscription_sqs.json}"
}

resource "aws_sqs_queue" "events" {
  name = "${var.env}-${var.event_subscription_queue_name}"

  tags {
    Environment = "${var.env}"
  }
}

resource "aws_sns_topic_subscription" "events_sqs_subscription" {
  topic_arn = "${var.cms_publish_topic}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.events.arn}"
}
