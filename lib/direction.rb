#!/usr/bin/ruby

class Direction

  DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]
  LEFT = -1
  RIGHT = 1

  def initialize(facing = nil)
	@facing = facing unless (DIRECTIONS.index(facing).nil? || facing == nil)
  end
  
  def left
	turn(LEFT)
  end
  
  def right
	turn(RIGHT)
  end
  
  def validate(facing)
    !DIRECTIONS.index(facing).nil?
  end
  
  attr_accessor :facing
  attr_reader :DIRECTIONS
  
  private
  
  def turn(side)
  	@facing = DIRECTIONS[(DIRECTIONS.index(@facing) + side) % DIRECTIONS.length]
  end
  
end