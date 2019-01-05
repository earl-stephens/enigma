class Key
  attr_reader :random_number,
              :random_number_array

  def initialize
    @random_number = 0
  end

  def random_number_generator
    generator = Random.new
    @random_number = generator.rand(100000)
    @random_number.to_i
  end

  def convert_random_number_to_array
    @random_number_array = @random_number.digits
    @random_number_array
  end

  def test_random_number(number)
    @random_number = number
  end

end
