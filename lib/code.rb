class Code 

  require 'colorize'

  @@default_colors = [:red, :yellow, :white, :green, :blue, :magenta]

  def initialize(input_string = "", sequence_length = 4)
    #creates a random color code corresponding to the @@default_colors indices
    @sequence = input_string.split(/\W+/).map{ |color| color.to_sym }

    if @sequence.empty?
      sequence_length.times { @sequence << @@default_colors[rand(0..5)] }
    end
  end

  def valid?
    @sequence.all? do |x|
      @@default_colors.any? { |y| y == x }
    end
  end

  def self.default_colors
    @@default_colors
  end

  def self.print_default_colors
    puts "Available color options are:"
    @@default_colors.each { |color| puts color.to_s.colorize(color) }
  end

  def sequence
    @sequence
  end

  def display(endline = "\n")
    @sequence.each do |x|
      print " " + "  ".colorize(:background => x.to_sym) + " "
    end
    print endline
  end

  def length
    @sequence.length
  end

  def compare(another_code)
    @sequence.zip(another_code.sequence).map { |x, y| x <=> y }.count(0)
  end

  def ==(another_code)
    self.compare(another_code) == @sequence.length 
  end

  def check_presence(another_code)
    colors_present = 0
    compare_sequence = another_code.sequence.clone

    @sequence.each do |x|
      if compare_sequence.include?(x)
        colors_present += 1
        compare_sequence.delete_at(compare_sequence.find_index(x))
      end
    end

    return colors_present
  end

  def color_and_position(another_code)
    self.compare(another_code)
  end

  def color_but_not_position(another_code)
    return self.check_presence(another_code) - self.compare(another_code)
  end

  def score(another_code)
    return self.color_and_position(another_code), self.color_but_not_position(another_code)
  end

  def display_difference(another_code, endline = "\n")
    black_pegs = color_and_position(another_code)
    white_pegs = color_but_not_position(another_code)

    black_pegs.times { print " " + " ".colorize(:background => :black) }
    white_pegs.times { print " " + " ".colorize(:background => :white) }
    print endline
  end

end 
