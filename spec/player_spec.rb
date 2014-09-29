require_relative '../lib/player.rb'

describe Player do 

  it { should respond_to "code_to_guess" }
  it { should respond_to "guess" }
  it { should respond_to "guess_hist" }

end
