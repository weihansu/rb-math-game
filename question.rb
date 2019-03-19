class Question
  attr_accessor :number_a, :number_b, :input

  def initialize
    @number_a = rand(20)
    @number_b = rand(20)

  end

  def answer
    number_a + number_b
  end

  def answer_input
    puts "What does #{number_a} plus #{number_b} equal?"
    @input = gets.chomp.to_i
  end

  def answer?
    input == answer
  end

end