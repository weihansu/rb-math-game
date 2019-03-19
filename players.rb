class Player

  attr_accessor :name, :short_name, :life

  def initialize(name, short_name)
    @name = name
    @short_name = short_name
    @life = 3
  end

  def wrong_question
    @life -= 1
  end

  def summary
    "#{@short_name} : #{@life}/3"

  end

  def dead?
    life <= 0
  end

  def give_result(answer)
    if answer
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
    end

  end
end