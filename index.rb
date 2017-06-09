require './Triangle'

begin
  msg_invalid_array = "Invalid or empty Array."

  raise msg_invalid_array if ARGV.empty?
  input = eval ARGV[0] rescue raise msg_invalid_array

  triangle = Triangle.new(input)
  total = triangle.maximum

  puts "Total: #{total}"

rescue Exception => e
  puts e.message
end