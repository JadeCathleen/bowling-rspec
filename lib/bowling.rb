class Bowling
  attr_reader :score

  def initialize
    @pin_total = []
    @score = 0
  end

  def hit(pin_count)
    @pin_total << pin_count
    if @pin_total.length == 20
      strike_index = @pin_total.find_index(10)
      if strike_index.nil?
        @score = @pin_total.reduce(:+)
      else
        @pin_total.push(@pin_total[strike_index + 1], @pin_total[strike_index + 2])
        @score = @pin_total.reduce(:+)
      end
    end
  end
end
