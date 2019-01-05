class Key
  attr_reader :random_number,
              # :random_number_array,
              :key_hash

  def initialize
    @random_number = ""
  end

  def random_number_generator
    generator = Random.new
    @random_number = generator.rand(100000)
    @random_number.to_s
  end

  # def convert_random_number_to_array
  #   @random_number_array = @random_number.digits
  #   @random_number_array
  # end

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

  def create_key_hash
    @key_hash = Hash.new
    letter_array = ("a".."d").to_a
    letter_array.each do |letter|
      key_hash[letter.to_sym] = 0
    end
    @key_hash
  end

  def populate_key_hash
    counter = 0
    @key_hash.each do |key, number|
      value = @random_number_array[counter]
    end

  end

end
