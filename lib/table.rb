#!/usr/bin/ruby

class Table

  def initialize(size_x, size_y)
    @size_x = size_x
	@size_y = size_y
  end

  def validate_position(position)
    (position.x.between?(0, @size_x)) and (position.y.between?(0, @size_y))
  end
  
  attr_reader :size_x, :size_y
end