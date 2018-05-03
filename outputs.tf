output "events_queue_arn" {
  value       = "${aws_sqs_queue.events.arn}"
  description = "ARN for the SQS events queue."
}

output "created_events_queue" {
  value       = "${aws_sqs_queue.events.id}"
  description = "Name of the created SQS events queue."
}
