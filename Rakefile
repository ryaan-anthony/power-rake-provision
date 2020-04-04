require 'power-rake'

INIT_CONFIG = [
  "--backend-config bucket=#{PowerRake.config.backend['bucket']}",
  "--backend-config dynamodb_table=#{PowerRake.config.backend['lock_table']}",
  "--backend-config key=#{PowerRake.config.project}/#{PowerRake.current_env}.tfstate"
]

TF_CONFIG = [
  "--var certificate_arn=#{PowerRake.config.certificate_arn}",
  "--var environment=#{PowerRake.current_env}",
  "--var instance_ami=#{PowerRake.config.instance['ami']}",
  "--var instance_count=#{PowerRake.config.instance['count']}",
  "--var instance_type=#{PowerRake.config.instance['type']}",
  "--var project=#{PowerRake.config.project}",
  "--var vpc_id=#{PowerRake.config.vpc_id}"
]

task :setup do
  puts INIT_CONFIG + TF_CONFIG
  continue? 'Continue?'
  try "terraform init #{INIT_CONFIG.join(' ')} terraform"
  try "terraform apply #{TF_CONFIG.join(' ')} terraform"
  puts 'Completed successfully!'
end

task :destroy do
  puts INIT_CONFIG + TF_CONFIG
  continue? 'Continue?'
  try "terraform init #{INIT_CONFIG.join(' ')} terraform"
  try "terraform destroy #{TF_CONFIG.join(' ')} terraform"
  puts 'Completed successfully!'
end
