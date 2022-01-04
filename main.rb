require './player.rb'
require './question.rb'

class Game
  def initialize
    @p1 = Player.new("Player 1", true)
    @p2 = Player.new("Player 2", false)
  end

  def next_turn
    generate_question
    check_answer
  end

  def check_for_winner
    if @p1.lives == 0
      puts "#{@p2.name} wins with a score of #{@p2.lives}/3\n----- GAME OVER -----\nGood bye!"
    elsif @p2.lives == 0
      puts "#{@p1.name} wins with a score of #{@p1.lives}/3\n----- GAME OVER -----\nGood bye!"
    else
      next_turn
    end
  end

  def generate_question
    @new_question = Question.new

    if @p1.turn
      puts "#{@p1.name}: #{@new_question.question}"
    else
      puts "#{@p2.name}: #{@new_question.question}"
    end
  end

  def check_answer
    if gets.chomp.to_i == @new_question.answer
      puts "YES! You are correct."
      if @p1.turn
        @p1.turn = false
        @p2.turn = true
      else 
        @p1.turn = true
        @p2.turn = false
      end
    else
      puts "Seriously? No!"
      if @p1.turn
        @p1.lives -= 1

        @p1.turn = false
        @p2.turn = true
      else
        @p2.lives -= 1
        
        @p1.turn = true
        @p2.turn = false
      end
    end

    puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"

    check_for_winner
  end
end

game = Game.new

game.next_turn