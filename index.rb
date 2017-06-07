require './Triangle'

begin

  input = [ [6], [3,5], [9,7,1], [4,6,8,4] ]
  
  triangle = Triangle.new(input)
  total = triangle.maximum

  puts "Total: #{total}"

rescue Exception => e
  puts e.message
end