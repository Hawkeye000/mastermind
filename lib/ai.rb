require_relative "player.rb"

class AI < Player

  CODE_LEN = 4

  def initialize 
    # map out all of the possible guesses for 
    @guessables = Code.default_colors.repeated_combination(CODE_LEN).to_a
    super
  end

end
