require_relative '../lib/code.rb'
require_relative '../lib/player.rb'

@code1 = Code.new

@code1.display

@code2 = Code.new

@code2.display

puts @code1.compare(@code2)

