class Code 

  @@default_colors = [:light_red, :yellow, :light_yellow, :green, :blue, :magenta]

  def self.default_colors
    @@default_colors
  end

  def initialize
    @sequence = Array.new(4)
  end

  def randomize 
    #creates a random color code corresponding to the @@default_colors indices
    @sequence.length.times { |i| @sequence[i] = @@default_colors[rand(0..5)]  }
  end

  def sequence
    @sequence
  end

end