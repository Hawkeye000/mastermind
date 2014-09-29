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
    print @sequence

    if @sequence.empty?
      sequence_length.times { @sequence << @@default_colors[rand(0..5)].to_s }
    end
  end

  def sequence
    @sequence
  end

  def display
    @sequence.each { |x| print " " + "  ".colorize(:background => x.to_sym) + " " }
    print "\n"
  end

  def valid?
    @sequence.all? do |x|
      @@default_colors.map { |color| color.to_s }.any? { |y| y == x }
    end
  end

  def compare(another_code)
    @sequence.zip(another_code.sequence).map { |x, y| x <=> y }.count(0)
  end


end 