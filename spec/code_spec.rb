require_relative "../lib/code.rb"

describe Code do 

  describe "Randomized code" do

    before do
      @code = Code.new.randomize
    end

    it { should respond_to "randomize" }

    it "should contain only default colors" do
      expect{ @code.sequence.all? { |code_item| code_item == Code.default_colors.any? } }.to be_true
    end
  
  end

end