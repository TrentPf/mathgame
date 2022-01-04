class Player
  attr_accessor :lives, :turn
  attr_reader :name

  def initialize(name, turn)
    @name = name
    @lives = 3
    @turn = turn
  end
end