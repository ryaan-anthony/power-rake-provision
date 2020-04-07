require 'config-reader'
require 'interactive-rake'

current_env = ENV.fetch('RAKE_ENV')
current_config = ENV.fetch('RAKE_CONFIG')
config = ConfigReader.new(current_config, current_env).config

INIT_BACKEND = [
  "--backend-config bucket=#{config.backend['bucket']}",
  "--backend-config dynamodb_table=#{config.backend['lock_table']}",
  "--backend-config key=#{config.project}/#{current_env}.tfstate"
].join(' ')

TF_PATH = config.terraform_path

TF_VARS = [
  "--var certificate_arn=#{config.certificate_arn}",
  "--var environment=#{current_env}",
  "--var instance_ami=#{config.instance['ami']}",
  "--var instance_count=#{config.instance['count']}",
  "--var instance_type=#{config.instance['type']}",
  "--var instance_user=#{config.instance['user']}",
  "--var project=#{config.project}",
  "--var vpc_id=#{config.vpc_id}"
].join(' ')

def try_command(command)
  puts(command) && continue?
  system(command) || abort("Aborted! `#{command}`")
end

task :init do
  try_command "terraform init #{INIT_BACKEND} #{TF_PATH}"
end

task :plan do
  try_command "terraform plan #{TF_VARS} #{TF_PATH}"
end

task :apply do
  try_command "terraform apply #{TF_VARS} #{TF_PATH}"
end

task :destroy do
  try_command "terraform destroy #{TF_VARS} #{TF_PATH}"
end
