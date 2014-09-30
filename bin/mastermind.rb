require_relative '../lib/code.rb'
require_relative '../lib/player.rb'

@player = Player.new

loop do 

  @player.code_to_guess.display_difference(@player.guess)



end


