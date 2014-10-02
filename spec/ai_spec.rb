require_relative "../lib/ai.rb"

describe AI do    

  before { @ai = AI.new }
  
  it "should contain a selection map" do
    expect(@ai.instance_variable_get(:@guessables)).to be_true
  end

  it "should store the selection map as codes" do
    index = rand(0..@ai.guessables.length)
    expect(@ai.guessables[index]).to be_a(Code)
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

      describe "reducing guessables after first guess" do
       
        before { @ai.reduce_guessables }

        subject { @ai.guessables }

        it { should_not include(@ai.guess_hist[0]) }

        describe "subsequent guesses" do

          before do 2.times { @ai.guess } end

          it "should choose a guess from @guessables" do
            expect(@ai.guessables).to include(@ai.guess_hist[1])
            expect(@ai.guessables).to include(@ai.guess_hist[2])
          end

        end
      
      end

    end

  end

end