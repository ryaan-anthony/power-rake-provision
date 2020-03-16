desc 'Provision the EKS cluster'
task :provision do
  prompt 'Provision EKS cluster?'
  try 'terraform init lib/terraform'
  try 'terraform apply lib/terraform'
  puts 'Completed successfully!'
end