require_relative '../lib/code.rb'

class Player

  def initialize
    @code_to_guess = Code.new
    @guess_hist = []
  end

  def guess
    puts "Enter your guess: "
    guess = $stdin.gets.chomp
    @code_guess = Code.new(guess)

    # if the user asks for "help"
    if @code_guess.sequence.any? { |input_word| input_word.downcase.include?("help") }
      Code.print_default_colors
    end

    if @code_guess.valid?
      @guess_hist << @code_guess
    end
  end

  def guess_hist
    @guess_hist
  end

  def code_to_guess
    @code_to_guess
  end

end


