class Bowling
  attr_reader :score

  def initialize
    @pin_total = []
    @score = 0
  end

  def hit(pin_count)
    @pin_total << pin_count
    if @pin_total.length == 20
      strike_index = @pin_total.index(10)
      pin_total_divided = double_subarray(@pin_total)
      spare_turn = pin_total_divided.select { |turn| turn[0] + turn[1] == 10 }.flatten
      spare_index = pin_total_divided.index(spare_turn)
      if strike_index.nil? && spare_index
        @pin_total.push(pin_total_divided[spare_index + 1][0])
      elsif spare_index.nil? && strike_index
        @pin_total.push(@pin_total[strike_index + 1], @pin_total[strike_index + 2])
      end
      @score = @pin_total.sum
    end
  end

  private

  def double_subarray(array)
    new_array = []
    for x in (0...20) do
      new_array << array.slice(x, 2) if x.even?
    end
    new_array
  end
end
