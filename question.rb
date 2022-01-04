class Question
  attr_reader :question, :answer

  def initialize
    value1 = rand(1...20)
    value2 = rand(1...20)
    @question = "What does #{value1} plus #{value2} equal?"
    @answer = value1 + value2
  end
end