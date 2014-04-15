#!/usr/bin/ruby

class Table

  def initialize(length, width)
    @length = length
	@width = width
  end
  
  def validate_position(position)
    (position.x.between?(0, @width)) and (position.y.between?(0, @length))
  end
  
  attr_reader :length, :width
end