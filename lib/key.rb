class Key
  attr_reader :random_number,
              :random_number_array,
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

  def test_random_number_for_5_digits?
    if @random_number.length < 5
      false
    else
      true
    end
  end

  def fill_in_zeroes
    if test_random_number_array_for_5_digits? == false
      while @random_number_array.length < 5
        @random_number_array << 0
      end
    end
    @random_number_array
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
