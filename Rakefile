$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'power-rake'

RAKE_ENV = PowerRake.current_env
RAKE_PROJECT = PowerRake.config.project
TERRAFORM_GROUPS = {
  main: {
    name: 'main infrastructure',
    path: 'lib/main',
    args: [
      "--var project=#{RAKE_PROJECT}",
      "--backend-config bucket=terraform-state-#{RAKE_PROJECT}",
      "--backend-config dynamodb_table=terraform-locks-#{RAKE_PROJECT}"
    ]
  },
  remote_state: {
    name: 'remote state',
    path: 'lib/remote_state',
    args: [
      "--var bucket=terraform-state-#{RAKE_PROJECT}",
      "--var dynamodb_table=terraform-locks-#{RAKE_PROJECT}"
    ]
  }
}

TERRAFORM_GROUPS.each do |group, config|
  namespace :setup do
    desc "Create #{config[:name]} for #{RAKE_ENV}"
    task group do
      continue? "Create #{config[:name]} for #{RAKE_ENV}?"
      try "terraform init #{config[:path]}"
      try "terraform apply #{config[:args].join(' ')} #{config[:path]}"
      puts 'Completed successfully!'
    end
  end

  namespace :destroy do
    desc "Teardown #{config[:name]} for #{RAKE_ENV}"
    task group do
      continue? "Teardown #{config[:name]} for #{RAKE_ENV}?"
      try "terraform destroy --lock=false #{config[:args].join(' ')} #{config[:path]}"
      puts 'Completed successfully!'
    end
  end
end
