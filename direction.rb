#!/usr/bin/ruby

class Direction

  DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]
  LEFT = -1
  RIGHT = 1

  def initialize(facing)
	@facing = facing
  end
  
  def left
	turn(LEFT)
  end
  
  def right
	turn(RIGHT)
  end
  
  attr_reader :facing
  
  private
  
  def turn(side)
  	@facing = DIRECTIONS[(DIRECTIONS.index(@facing) + side) % DIRECTIONS.length]
	
  end
  
end