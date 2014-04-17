$LOAD_PATH.unshift File.dirname(__FILE__)
#!/usr/bin/ruby
require 'position.rb'
require 'direction.rb'

class Robot

  def initialize(table_size)
	@position = nil
    @direction = nil
	@table = table_size
  end

  def place(x, y, f)
    @position = Position.new if @position.nil?
	@direction = Direction.new if @direction.nil?
	
	if @table.validate_position(Position.new(x, y)) && @direction.validate(f)
	  @position.place(x, y)
	  @direction.facing = f	
	end
  end
  
  def move
    case @direction.facing
	when "NORTH"
	  @position.y += 1 if @position.y.between?(0, @table.size_y - 1)
	when "EAST"
	  @position.x += 1 if @position.x.between?(0, @table.size_x - 1)
	when "SOUTH"
	  @position.y -= 1 if @position.y.between?(1, @table.size_y)
	when "WEST"
	  @position.x -= 1 if @position.x.between?(1, @table.size_x)
	else
	  puts "Invalid direction faced. Please re-place toy robot"
	end
  end
  
  def left
    @direction.left
  end
  
  def right
    @direction.right
  end
  
  def report
    "#{@position.x},#{@position.y},#{@direction.facing}"
  end
  
  attr_reader :position, :direction

end