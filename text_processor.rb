#import Register class
require_relative 'register'

# load input text file from command line args
file = ARGV.first
text=File.open(file).read

# initiate Register object
register = Register.new()

# process each line in text file and add to register
text.each_line do |line|
  register.process_line(line)
end

# output the current status of the register
register.display
