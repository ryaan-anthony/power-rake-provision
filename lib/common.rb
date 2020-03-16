
# Inline message prompt
# @param [String]
def prompt(message)
  print "#{message} (y|n)"
  abort 'Aborted!' unless STDIN.gets.downcase.strip == 'y'
end

# Try a system command
# @param [string]
def try(command)
  puts "START: #{command}"
  system(command) || abort("Unable to run `#{command}` (see error above)")
  puts "FINISHED: #{command}"
end