require_relative '../lib/code.rb'
require_relative '../lib/player.rb'

@player = Player.new

TURNS = 12

puts "Type 'help' to see a list of available colors"
puts "Enter your guess in the format: '[color] [color] [color] [color]\n"

loop do 

  # exception case if the player has lost
  if @player.guess_hist.length >= TURNS
    puts "You Lose"
    puts "The Correct Code was:"
    @player.code_to_guess.display
    break
  end

  @guess = @player.guess

  next unless @guess.is_a?(Code)

  @guess.display("    ")
  @guess.display_difference(@player.code_to_guess)

  if @player.has_won?
    puts "You Won!"
    break
  end

end


