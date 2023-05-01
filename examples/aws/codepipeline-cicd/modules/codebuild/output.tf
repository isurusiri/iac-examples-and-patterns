output "id" {
  value       = aws_codebuild_project.main[*].id
  description = "List of IDs of the Codebuild projects."
}

output "name" {
  value       = aws_codebuild_project.main[*].name
  description = "List of names of the Codebuild projects."
}

output "arn" {
  value       = aws_codebuild_project.main[*].arn
  description = "List of ARNs of the Codebuild projects."
}
