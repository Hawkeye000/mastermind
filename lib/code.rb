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

  def initialize(sequence_length)
    #creates a random color code corresponding to the @@default_colors indices
    @sequence = []
    sequence_length.times { @sequence << @@default_colors[rand(0..5)] }
  end

  def sequence
    @sequence
  end

  def display
    @sequence.each { |x| print " " + "  ".colorize(:background => x) + " " }
    print "\n"
  end

  def valid?
    @sequence.all? do |x|
      @@default_colors.map { |color| color.to_sym }.any? { |y| y == x }
    end
  end

end 