require_relative "../lib/code.rb"

describe Code do 

  before do
    @code = Code.new
  end

  it "should contain only default colors" do
    expect{ @code.sequence.all? { |code_item| code_item == Code.default_colors.any?.to_s } }.to be_true
  end

  describe "when a sequence is valid" do
    subject { @code.valid? }
    it { should be_true }
    subject { Code.new("blue, red, green, white").valid? }
    it { should be_true }
  end

  describe "when a sequence is invalid" do
    before do
      @code.sequence[1] = "apple"
    end

    subject { @code.valid? }

    it { should_not be_true }
  end

  describe "when codes are compared" do

    it "should know when a correct color is in the correct location" do
      @code1 = Code.new("red, blue, green, white", )
      @code2 = Code.new("red, green, blue, blue", )
      expect(@code1.compare(@code2)).to eq(1)
    end

  end




end