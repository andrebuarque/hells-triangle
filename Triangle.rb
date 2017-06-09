class Triangle
  attr_accessor :maximum
  attr_writer :data
  
  ERR_INVALID_ARRAY_INPUT = 'Invalid or empty Array.'
  ERR_INVALID_TRIANGLE = 'Invalid Triangle.'

  def initialize(arr)
    @data = arr
    validate_triangle
    @data.sort_by! { |n| n.length }
  end

  def maximum
    maximum_total(@data)
  end

  def data=(arr)
    initialize(arr)
  end

  private
    
    # calculates the maximum total
    def maximum_total(arr, row = 0, index = 0, total = 0)
      number = arr[row][index]
      total += number

      return total if (arr.length - 1) == row

      row += 1
      index += 1 if arr[row][index] < arr[row][index + 1]

      maximum_total(arr, row, index, total)
    end

    # validates the array input
    def validate_triangle()
      if @data.class != Array || @data.empty?
        raise ERR_INVALID_ARRAY_INPUT
      end

      @data.reduce(0) do |t, curr|
        t + curr.reduce(0) { |total, n| total + n }
      end rescue raise msg_invalid_array

      total_items = @data.reduce(0) { |total, n| total + n.length }

      if total_items != sum_up_to_one(@data.length)
        raise ERR_INVALID_TRIANGLE
      end
    end

    def sum_up_to_one(n, total = 0)
      return total if n == 0
      sum_up_to_one(n - 1, n + total)
    end
end