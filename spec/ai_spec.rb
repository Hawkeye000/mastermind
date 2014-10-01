require_relative "../lib/ai.rb"

describe AI do    
  
  it "should contain a selection map" do
    @ai = AI.new
    expect(@ai.instance_variable_get(:@guessables)).to be_true
  end


end