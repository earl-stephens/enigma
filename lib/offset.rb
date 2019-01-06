require 'pry'
class Offset
  attr_reader :time

  def get_time
    @time = Time.new
  end

  def test_time_helper_method(time)
    @time = time
  end

  def format_time
    @time = @time.strftime("%d%m%Y")
    @time = @time[0..3] + @time[6..7]
    @time
  end

  def convert_time_to_integer
    numeric_time = @time.to_i
  end

  def square_the_numeric_time
    numeric_time = convert_time_to_integer
    time_squared = numeric_time ** 2
  end

end
