#!/usr/bin/ruby

class Position

  def initialize(x, y)
    @x = x
	@y = y
  end
  
  attr_reader :x, :y
end