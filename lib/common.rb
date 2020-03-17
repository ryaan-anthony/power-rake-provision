# Prompt with control flow
# @param [String]
def continue?(message)
  abort 'Aborted!' unless prompt("#{message} (y|n)").downcase == 'y'
end

# Inline message prompt
# @param [String]
def prompt(message)
  print message
  STDIN.gets.strip
end

# Try a system command
# @param [string]
def try(command)
  puts "START: #{command}"
  system(command) || abort("Unable to run `#{command}` (see error above)")
  puts "FINISHED: #{command}"
end
