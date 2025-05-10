require 'colorize'

class Colors
  attr_reader :colors_array

  def initialize
    @colors_array = [
      "Blue".colorize(:blue),
      "Red".colorize(:red),
      "Green".colorize(:green),
      "Yellow".colorize(:yellow),
      "Black".colorize(:black),
      "White"
    ]
  end
end