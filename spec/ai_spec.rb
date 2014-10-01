require_relative "../lib/ai.rb"

describe AI do    

  before { @ai = AI.new }
  
  it "should contain a selection map" do
    expect(@ai.instance_variable_get(:@guessables)).to be_true
  end

  describe "making guesses" do

    describe "the first guess" do

      before do 
        @ai.guess
      end

      it "should return a code" do
        expect(@ai.guess).to be_a(Code)
      end

      it "should begin guessing with an 'AABB' Code" do
        first_guess = @ai.guess_hist[0].sequence
        expect([first_guess[0], first_guess[2]]).to eq([first_guess[1], first_guess[3]])
      end

    end

  end

end