require_relative 'turn-manager'
require_relative 'players'

class Game
  attr_accessor :players, :turn_manager

  def initialize
    player1 = Player.new("Player 1", "P1")
    player2 = Player.new("Player 2", "P2")

    @players = [player1, player2]
    @turn_manager = TurnManager.new(@players)

  end

  def play
    while (not game_over?)
      header

      this_turn = @turn_manager
      this_turn.make_question

      if not this_turn.question.answer?
        this_turn.get_responder.wrong_question
      end

      puts
      print "#{this_turn.get_asker.name}: "
      this_turn.get_asker.give_result(this_turn.question.answer?)

      puts
      players_summary
      this_turn.next_turn

      sleep 2
    end

    footer

  end

  def alive_players
    @players.select { |p| not p.dead?}
  end

  def game_over?
    alive_players.count == 1

  end

  def players_summary
    puts "#{@players[0].summary} vs #{@players[1].summary}"
  end

  private

  def header
    puts
    puts "------- NEW TURN -------"
    puts

  end

  def footer
    puts
    puts "------- GAME OVER -------"
    puts "Good bye!"

  end

end