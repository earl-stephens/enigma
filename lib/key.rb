class Key
  attr_reader :random_number

  def initialize
    @random_number = 0
  end

  def random_number_generator
    generator = Random.new
    @random_number = generator.rand(100000)
    @random_number.to_i
  end

end
