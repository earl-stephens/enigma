class Key
  attr_reader :random_number,
              :key_array

  def initialize
    @random_number = ""
    @key_array =[]
  end

  def main_test_method(number)
    test_random_number(number)
    fill_in_zeroes
    # create_key_hash
    populate_key_array
  end

  def random_number_generator
    generator = Random.new
    @random_number = generator.rand(100000)
    @random_number.to_s
    return generator
  end

  def test_random_number(number)
    @random_number = number
  end

  def fill_in_zeroes
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

  # def create_key_hash
  #   @key_hash = Hash.new
  #   letter_array = ("a".."d").to_a
  #   letter_array.each do |letter|
  #     @key_hash[letter.to_sym] = 0
  #   end
  #   @key_hash
  # end

  def populate_key_array
    counter = 0
    4.times do
      number = @random_number[counter].concat(@random_number[counter + 1])
      @key_array << number
      counter += 1
    end
    @key_array
  end

end
