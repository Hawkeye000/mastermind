require_relative "../lib/code.rb"

describe Code do 

  before do
    @code = Code.new(4)
  end

  it "should contain only default colors" do
    expect{ @code.sequence.all? { |code_item| code_item == Code.default_colors.any? } }.to be_true
  end

  describe "when a sequence is valid" do
    subject{ @code.valid? }

    it { should be_true }
  end

  describe "when a sequence is invalid" do
    before do
      @code.sequence[1] = "apple"
    end

    subject { @code.valid? }

    it { should_not be_true }
  end


end