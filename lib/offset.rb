class Offset
  attr_reader :time

  def main_test_method(date)
    test_time_helper_method(date)
    convert_time_to_integer
    square_the_numeric_time
    get_the_last_four
  end

  def main_method
    get_time
    format_time
    convert_time_to_integer
    square_the_numeric_time
    get_the_last_four
  end

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

  def get_the_last_four
    last_four = []
    time_squared = square_the_numeric_time
    intermediate_array = time_squared.digits.reverse
    last_four = intermediate_array[-4..-1]
    last_four
  end

end
