require_relative "player.rb"

class AI < Player

  CODE_LEN = 4

  def initialize 
    # map out all of the possible guesses for 
    possible_combos = Code.default_colors.repeated_combination(CODE_LEN).to_a
    @guessables = possible_combos.map! { |x| Code.new(x.join(" ")) }
    super
  end

  def guessables
    @guessables
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

<<<<<<< HEAD
=======
    # test each element of @guessables against the guess made
    @guessables.each_with_index do |x, i|
      #remove the exact guess from the list of guessables
      if x == guess
        @guessables.delete_at(i)
      end

      unless guess.color_and_position(x) == black_pegs  && guess.color_but_not_position(x) == white_pegs
        # remove all from map that does not have the same number of white and black pegs when compared to the guess
        @guessables.delete_at(i)
      end
    end
>>>>>>> master
  end


end
