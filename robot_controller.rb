$LOAD_PATH.unshift File.dirname(__FILE__)
#!/usr/bin/ruby
require 'lib/robot.rb'
require 'lib/table.rb'

module TableSize
  X = 5
  Y = 5
end

class RobotController
  def initialize
    @robot = Robot.new(Table.new(TableSize::X,TableSize::Y))
	@robot_placed = false
  end
  
  attr_reader :robot, :robot_placed
  
  def help
    puts
    puts "---------------------------------------- Commands List ----------------------------------------"
	puts "PLACE X,Y,F - Places the robot in position (X,Y) in the direction F (NORTH, EAST, SOUTH, WEST)"
	puts "MOVE        - Moves the robot forward 1 unit in the current direction, if possible"
	puts "LEFT        - Turns the robot left of its current direction"
	puts "RIGHT       - Turns the robot right of its current direction"
	puts "REPORT      - Reports the current position and direction"
	puts "EXIT/QUIT   - Exit the application"
	puts
  end
  
  def issue_command(command)
    case command
    when /^PLACE (\d+),(\d+),([A-Z]+)$/
      @robot.place($1.to_i,$2.to_i,$3)
      @robot_placed = true
    when "MOVE"
      @robot.move if @robot_placed
    when "LEFT"
      @robot.left if @robot_placed
    when "RIGHT"
      @robot.right if @robot_placed
    when "REPORT"
      puts @robot.report if @robot_placed
    when "HELP"
      help
    when "EXIT", "QUIT"
      exit
	#ignore every other input
    else
	  #p command
      #puts "Invalid command. Type ""HELP"" for list of valid commands"
      #puts
    end
  end
  
  def read_file(filename)
    if File.exists?(filename)
	  input_file = File.open(filename, 'r')
	  input_file.each_line do | line |
	    issue_command(line.chomp)
	  end
	  input_file.close
	else
	  puts "File '#{filename}' was not found"
	end
  end
  
  def console_input(input = "")
    while (input != "QUIT")
      print "Enter command (HELP for list):> "
      input = $stdin.gets.chomp
	  issue_command(input.upcase!)
	  if (!@robot_placed && !["MOVE", "LEFT", "RIGHT", "REPORT"].index(input).nil?)
	    puts "Please place the robot before issuing any other commands"
	    puts
	  end
	end
  end
  
  def main
	#file input
	if ARGV.length > 0
       read_file(ARGV[0])
	#user console input
	else
       console_input
    end
  end
end

RobotController.new.main