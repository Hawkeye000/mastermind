require_relative "player.rb"

class AI < Player

  CODE_LEN = 4

  def initialize 
    # map out all of the possible guesses for 
    @guessables = Code.default_colors.repeated_combination(CODE_LEN).to_a
    super
  end

  def guess

    guess = Array.new(CODE_LEN)

    # exception case for when it is the first guess
    # it will start by guessing a random code of type 'AABB'
    if @guess_hist.empty?
      guess[0], guess[2] = Code.default_colors[rand(0..5)].to_s, Code.default_colors[rand(0..5)].to_s
      guess[1], guess[3] = guess[0], guess[2]
      @code_guess = Code.new(guess.join(" "))
    end

    if @code_guess.valid?
      @guess_hist << @code_guess
      return @code_guess
    end

  end

  def reduce_guessables(guess = @guess_hist.last)
    # code for applying the Knuth algorithm
    black_pegs = guess.color_and_position(@code_to_guess)
    white_pegs = guess.color_but_not_position(@code_to_guess)

  end


end
