require_relative '../lib/player.rb'
require 'stringio'

describe Player do 

  it { should respond_to "code_to_guess" }
  it { should respond_to "guess" }
  it { should respond_to "guess_hist" }

  before do
    @player = Player.new
  end 

  describe "making a guess" do

    before do
      $stdin = StringIO.new("red blue red blue\n")
      @player.guess
    end

    after do
      $stdin = STDIN 
    end

    it "should add valid guesses to the history" do
      expect(@player.guess_hist.length).to be > 0
    end
  end

end
