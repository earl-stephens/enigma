class Key
  attr_reader :random_number,
              :key_array,
              :converted_key_array,
              :number_as_string

  def initialize
    @random_number = ""
    @key_array =[]
    @converted_key_array = []
  end

  def main_test_method(number)
    test_random_number(number)
    fill_in_zeroes
    populate_key_array
    convert_key_array
  end

  def main_method
    random_number_generator
    fill_in_zeroes
    populate_key_array
    convert_key_array
  end

  def random_number_generator
    generator = Random.new
    @random_number = generator.rand(100000)
    @random_number = @random_number.to_s
    return generator
  end

  def test_random_number(number)
    @random_number = number
  end

  def fill_in_zeroes
    @random_number = @random_number.rjust(5, "0")
    @number_as_string = @random_number
    @random_number
  end

  def populate_key_array
    counter = 0
    4.times do
      number = @random_number[counter].concat(@random_number[counter + 1])
      @key_array << number
      counter += 1
    end
    @key_array
  end

  def convert_key_array
    @key_array.map do |element|
      @converted_key_array << element.to_i
    end
    @converted_key_array
  end

end
