require_relative '../lib/code.rb'

class Player

  def initialize
    @code_to_guess = Code.new
    @guess_hist = []
  end

  def guess
    puts "Enter your guess: (type 'help' for a list of options)"
    guess = $stdin.gets.chomp
    @code_guess = Code.new(guess)

    # if the user asks for "help"
    if @code_guess.sequence.any? { |input_word| input_word.downcase.include?("help") }
      return Code.print_default_colors
    end

    if @code_guess.length != @code_to_guess.length
      return print "The code must be #{@code_to_guess.length.to_s} colors.\n"
    end

    if @code_guess.valid?
      @guess_hist << @code_guess
      return @code_guess
    else
      puts "Please enter a valid code!"
    end

  end

  def guess_hist
    @guess_hist
  end

  def code_to_guess
    @code_to_guess
  end

  def has_won?
    @guess_hist.any? { |guess| guess == @code_to_guess }
  end

end


