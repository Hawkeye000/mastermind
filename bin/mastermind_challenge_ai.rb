require_relative '../lib/code.rb'
require_relative '../lib/player.rb'
require_relative '../lib/ai.rb'

@player = Player.new
@ai = AI.new

TURNS = 12

begin 
  puts "Enter a 4-color code in this format '[color] [color] [color] [color]' to challenge the computer"
  puts "Type 'help' to see a list of available colors"
  @ai.code_to_guess = @player.guess
end until @ai.code_to_guess.instance_of?(Code)

loop do 

  # exception case if the player has lost
  if @ai.guess_hist.length >= TURNS
    puts "AI loses"
    puts "The Correct Code was:"
    @ai.code_to_guess.display
    break
  end

  @guess = @ai.guess

  next unless @guess.is_a?(Code)

  @guess.display("    ")
  @guess.display_difference(@ai.code_to_guess)

  if @ai.has_won?
    puts "AI has solved the code!"
    break
  end

  wait(2)

end