#!/usr/bin/ruby

class Position

  def initialize(x = nil, y = nil)
    place(x, y)
  end
  
  def place(x, y)
    @x = x
	@y = y
  end
  
  attr_accessor :x, :y
end