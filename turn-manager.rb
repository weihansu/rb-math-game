require_relative 'question'

class TurnManager
  attr_accessor :players, :question, :current_turn

  def initialize(players)
    @players = players
    @current_turn = 1

    @question = Question.new()

  end

  def get_asker
    @players[(@current_turn + 1) % @players.count]

  end

  def get_responder
    @players[(@current_turn) % @players.count]

  end

  def make_question
    print "#{get_asker.name}: "
    @question.answer_input

  end

  def next_turn
    @current_turn += 1
    @question = Question.new()

  end

end