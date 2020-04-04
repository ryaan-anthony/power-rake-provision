require 'power-rake'

RAKE_ENV = PowerRake.current_env
RAKE_PROJECT = PowerRake.config.project
BACKEND_CONFIG = [
  "--backend-config bucket=#{PowerRake.config.backend['bucket']}",
  "--backend-config dynamodb_table=#{PowerRake.config.backend['lock_table']}",
  "--backend-config key=#{RAKE_PROJECT}/#{RAKE_ENV}.tfstate"
].join(' ')

desc 'Run terraform apply'
task :setup do
  continue? "Run terraform apply for #{RAKE_ENV}?"
  try "terraform init #{BACKEND_CONFIG} terraform"
  try "terraform apply terraform"
  puts 'Completed successfully!'
end

desc 'Run terraform destroy'
task :destroy do
  continue? "Run terraform destroy for #{RAKE_ENV}?"
  try "terraform init #{BACKEND_CONFIG} terraform"
  try "terraform destroy terraform"
  puts 'Completed successfully!'
end
