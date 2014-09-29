require_relative '../lib/code.rb'

class Player

  def initialize
    @code_to_guess = Code.new(4)
    @guess_hist = []
  end

  def guess
    puts "Enter your guess: "
    guess = gets.chomp.split

    # if the user asks for "help"
    if guess.any? { |input_word| input_word.downcase.include?("help") }
      Code.print_default_colors
    end

    if guess.valid?
      @guess_hist << guess
    end
  end

  def guess_hist
    @guess_hist
  end

  def code_to_guess
    @code_to_guess
  end

end


