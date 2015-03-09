require_relative "../lib/code.rb"

describe Code do 

  let(:code) { Code.new }
    #code.sequence.each{|p| print p; puts}

  it "should contain only default colors" do
    result = code.sequence.all? { |c| Code.default_colors.member?(c) }
    expect(result).to be_truthy
  end

  describe '#valid?' do
    let(:code) { Code.new }

    context "valid sequence," do
      it 'returns true' do
        expect(code.valid?).to be_truthy
      end
      it 'returns true on anonymous objects too' do
        expect(Code.new('blue, red, green, white').valid?).to be_truthy
      end
    end

    context "invalid sequence," do
      it 'returns false when not valid sequence' do
        code.sequence[1] = 'apple'
        expect(code.valid?).to be_falsey
      end
    end
  end

  describe "comparing objects" do

    before do
      @code1 = Code.new("red, blue, green, white", )
      @code2 = Code.new("red, green, blue, blue", )
    end

    it "should know when a correct color is in the correct location" do
      expect(@code1.compare(@code2)).to eq(1)
    end

    it "should know how many colors at least exist that match" do
      expect(@code1.check_presence(@code2)).to eq(3)
    end

    it "should know the number of black pegs to place" do
      expect(@code1.color_and_position(@code2)).to eq(1)
    end

    it "should know the number of white pegs to place" do
      expect(@code1.color_but_not_position(@code2)).to eq(2)
    end

    it "should know when codes are equal" do
      expect(@code1 == @code1).to be_truthy
    end

    it "should know when codes are not equal" do
      expect(@code1==@code2).to be_falsey
    end
  end

end
