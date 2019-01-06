class Key
  attr_reader :random_number,
              :key_array,
              :converted_key_array

  def initialize
    @random_number = ""
    @key_array =[]
    @converted_key_array = []
  end

  def main_test_method(number)
    test_random_number(number)
    fill_in_zeroes
    # create_key_hash
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
    # binding.pry
    case @random_number.length
    when 1
      zero = "0000"
      @random_number = zero.concat(@random_number)
    when 2
      zero = "000"
      @random_number = zero.concat(@random_number)
    when 3
      zero = "00"
      @random_number = zero.concat(@random_number)
    when 4
      zero = "0"
      @random_number = zero.concat(@random_number)
    else
    end
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
    # binding.pry
    @converted_key_array
  end

end
