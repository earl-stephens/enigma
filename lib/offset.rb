class Offset
  attr_reader :time

  def get_time
    @time = Time.new
  end

  def test_time_helper_method(time)
    @time = time
  end

end
