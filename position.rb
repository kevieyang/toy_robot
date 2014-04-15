#!/usr/bin/ruby

class Position

  def initialize(x, y, f)
    @x = x
	@y = y
	@facing = f
  end
  
  attr_reader :x, :y, :facing
end