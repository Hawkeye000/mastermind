class Code 

  require 'colorize'

  @@default_colors = [:red, :yellow, :white, :green, :blue, :magenta]

  def self.default_colors
    @@default_colors
  end

  def self.print_default_colors
    puts "Available color options are:"
    @@default_colors.each { |color| puts color.to_s.colorize(color) }
  end

  def initialize(input_string = "", sequence_length = 4)
    #creates a random color code corresponding to the @@default_colors indices
    @sequence = input_string.split(/\W+/)
    # print @sequence

    if @sequence.empty?
      sequence_length.times { @sequence << @@default_colors[rand(0..5)].to_s }
    end
  end

  def sequence
    @sequence
  end

  def display(endline = "\n")
    @sequence.each { |x| print " " + "  ".colorize(:background => x.to_sym) + " " }
    print endline
  end

  def valid?
    @sequence.all? do |x|
      @@default_colors.map { |color| color.to_s }.any? { |y| y == x }
    end
  end

  def compare(another_code)
    @sequence.zip(another_code.sequence).map { |x, y| x <=> y }.count(0)
  end

  def ==(another_code)
    self.compare(another_code) == @sequence.length 
  end

  def check_presence(another_code)
    colors_present = 0
    @sequence.each { |x| colors_present += 1 if another_code.sequence.include?(x) }
    return colors_present
  end

  def color_and_position(another_code)
    self.compare(another_code)
  end

  def color_but_not_position(another_code)
    return self.check_presence(another_code) - self.compare(another_code)
  end

  def display_difference(another_code, endline = "\n")
    black_pegs = color_and_position(another_code)
    white_pegs = color_but_not_position(another_code)

    black_pegs.times { print " " + " ".colorize(:background => :black) }
    white_pegs.times { print " " + " ".colorize(:background => :white) }
    print endline
  end

end 