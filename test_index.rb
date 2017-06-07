require 'test/unit'
require 'test/unit/ui/console/testrunner'

require './Triangle'

class IndexTest < Test::Unit::TestCase

  def test_valid_triangle
    input = [ [6], [3,5], [9,7,1], [4,6,8,4] ]

    obj = Triangle.new input

    assert_equal(26, obj.maximum)
  end

  def test_valid_triangle_with_negative_values
    input = [ [6], [3,5], [0,0,0], [-2,-1,-8,-4] ]

    obj = Triangle.new input

    assert_equal(10, obj.maximum)
  end

  def test_valid_triangle_with_negative_values_1
    input = [ [6], [3,5], [0,0,0], [-2,-1,0,-4] ]

    obj = Triangle.new input

    assert_equal(11, obj.maximum)
  end

  def test_valid_triangle_with_zero_values_only
    input = [ [0], [0,0], [0,0,0], [0,0,0,0] ]

    obj = Triangle.new input

    assert_equal(0, obj.maximum)
  end

  def test_invalid_triangle
    input = [ [6], [3,5], [9,7,1], [4,6,8] ]

    assert_raise do
      obj = Triangle.new input  
    end

  end

  def test_invalid_triangle_with_string_values
    input = [ [6], [3,5], [9,7,1], [4,6,8,'1'] ]

    assert_raise do
      obj = Triangle.new input  
    end
    
  end

  def test_empty_input
    input = []

    assert_raise do
      obj = Triangle.new input  
    end
  end

  def test_invalid_input
    invalid_inputs = ["", nil, 1, {}]

    invalid_inputs.each do |input|
      assert_raise do
        obj = Triangle.new input  
      end
    end
  end
end

Test::Unit::UI::Console::TestRunner.run(IndexTest)