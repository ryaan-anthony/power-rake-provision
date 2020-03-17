require 'securerandom'
BACKEND_CONFIG = 'lib/terraform/backend.hcl'

desc 'Create/update the EKS cluster and VPC network'
task :setup do
  continue? "Create/update EKS cluster and VPC network?"
  create_backend_config
  init_and_apply(:backend)
  init_and_apply(:cluster)
  puts 'Completed successfully!'
end

desc 'Teardown the EKS cluster and VPC network'
task :teardown do
  continue? "Teardown the EKS cluster and VPC network?"
  try "terraform destroy --lock=false --var-file=#{BACKEND_CONFIG} lib/terraform/cluster"
  puts 'Completed successfully!'
end

def create_backend_config
  project = SecureRandom.hex
  variables = [
    "bucket = \"terraform-state-#{project}\"",
    "dynamodb_table = \"terraform-locks-#{project}\""
  ]
  system "echo '#{variables.join('\n')}' > #{BACKEND_CONFIG}"
end

def init_and_apply(template)
  try "terraform init --backend-config=#{BACKEND_CONFIG} lib/terraform/#{template}"
  try "terraform apply --var-file=#{BACKEND_CONFIG} lib/terraform/#{template}"
end
