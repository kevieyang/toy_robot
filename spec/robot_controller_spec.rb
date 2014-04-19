#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require 'stringio'
require '../robot_controller.rb'

describe RobotController do

  before(:each) do
    @rc = RobotController.new
  end
  
  def capture_stdout(&blk)
    old = $stdout
    $stdout = fake = StringIO.new
	blk.call
	fake.string
  ensure
    $stdout = old  
  end
    
  context "when reading input from file" do
    it "handles the PLACE command" do
	  @rc.read_file(File.dirname(__FILE__) + "/data/place.txt")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 1
	  @rc.robot.direction.facing.should == "NORTH"
	end
	
    it "handles the MOVE command" do
	  @rc.read_file(File.dirname(__FILE__) + "/data/move.txt")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 2
	  @rc.robot.direction.facing.should == "NORTH"
	end
	
    it "handles the LEFT command" do
	  @rc.read_file(File.dirname(__FILE__) + "/data/left.txt")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 1
	  @rc.robot.direction.facing.should == "WEST"
	end
	
    it "handles the RIGHT command" do
	  @rc.read_file(File.dirname(__FILE__) + "/data/right.txt")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 1
	  @rc.robot.direction.facing.should == "EAST"
	end
	
    it "handles the REPORT command" do
	  printed = capture_stdout do
	    @rc.read_file(File.dirname(__FILE__) + "/data/report.txt")
	  end
	  
	  printed.chomp.should eql("0,1,NORTH")
	end
	
  end
  
  context "when in console input" do
    it "handles the PLACE command" do
	  @rc.issue_command("PLACE 0,1,NORTH")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 1
	  @rc.robot.direction.facing.should == "NORTH"
	end
	
    it "handles the MOVE command" do
	  @rc.issue_command("PLACE 0,1,NORTH")
	  @rc.issue_command("MOVE")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 2
	  @rc.robot.direction.facing.should == "NORTH"
	end
	
    it "handles the LEFT command" do
	  @rc.issue_command("PLACE 0,1,NORTH")
	  @rc.issue_command("LEFT")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 1
	  @rc.robot.direction.facing.should == "WEST"
	end
	
    it "handles the RIGHT command" do
	  @rc.issue_command("PLACE 0,1,NORTH")
	  @rc.issue_command("RIGHT")
	  @rc.robot.position.x.should == 0
	  @rc.robot.position.y.should == 1
	  @rc.robot.direction.facing.should == "EAST"
	end
	
    it "handles the REPORT command" do
	  printed = capture_stdout do
	    @rc.issue_command("PLACE 0,1,NORTH")
	    @rc.issue_command("REPORT")
	  end
	  
	  printed.chomp.should eql("0,1,NORTH")
	end
  end
end