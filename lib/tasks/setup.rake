namespace :setup do
  desc 'Provision the EKS cluster'
  task :cluster, [:workspace] do |t, args|
    workspace = args[:workspace] || :default
    prompt "Provision EKS #{workspace} cluster?"
    try 'terraform init lib/terraform/compute'
    system("terraform workspace new #{workspace}") ||
      system("terraform workspace select #{workspace}")
    try 'terraform apply lib/terraform/compute'
    puts 'Completed successfully!'
  end

  desc 'Provision the VPC and security groups'
  task :network do
    prompt "Provision VPC and security groups?"
    try 'terraform workspace select default'
    try 'terraform init lib/terraform/network'
    try 'terraform apply lib/terraform/network'
    puts 'Completed successfully!'
  end
end
