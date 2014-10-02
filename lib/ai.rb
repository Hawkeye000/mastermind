require_relative "player.rb"

class AI < Player

  CODE_LEN = 4

  attr_accessor :code_to_guess

  def initialize 
    # map out all of the possible guesses for 
    possible_combos = Code.default_colors.repeated_permutation(CODE_LEN).to_a
    @guessables = possible_combos.map { |x| Code.new(x.join(" ")) }
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
    else
      # otherwise select a code remaining from @guessables
      if @guessables.empty?
        # print "Out of Codes"
        @code_guess = Code.new
      else
        @code_guess = @guessables[rand(0...@guessables.length)]
      end
    end

    if @code_guess.valid?
      @guess_hist << @code_guess
      return @code_guess
    end

  end

  def reduce_guessables(guess = @guess_hist.last)

    @guessables.delete_if { |x| x == guess }

    @guessables.delete_if { |x| (x.score(guess) <=> guess.score(@code_to_guess)) != 0 }
    
    # puts @guessables.length.to_s + " remaining"
  end


end
