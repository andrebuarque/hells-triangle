require './Triangle'

begin

  raise Triangle.ERR_INVALID_ARRAY_INPUT if ARGV.empty?
  input = eval ARGV[0] rescue raise Triangle.ERR_INVALID_ARRAY_INPUT

  triangle = Triangle.new(input)
  total = triangle.maximum

  puts "Total: #{total}"

rescue Exception => e
  puts e.message
end