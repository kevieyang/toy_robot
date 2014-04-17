#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../lib/robot.rb'
require '../lib/table.rb'

describe Robot do

  before(:each) do
    @rob = Robot.new(Table.new(5,5))
  end
  
  it "places the robot when given a valid position" do
	@rob.place(0, 0, "NORTH")
	@rob.report.should eql("0,0,NORTH")
  end
  
  it "does not place the robot when given an invalid position" do
	@rob.place(6, 6, "NORTH")
	@rob.report.should eql("#{nil},#{nil},#{nil}")
  end

  it "does not place the robot when given an invalid direction" do
	@rob.place(2, 2, "nnnnn")
	@rob.report.should eql("#{nil},#{nil},#{nil}")
  end
  
  it "re places the robot" do
	@rob.place(0, 0, "NORTH")
	@rob.place(2, 3, "WEST")
	@rob.report.should eql("2,3,WEST")
  end
  
  it "moves the robot forward in the NORTH direction" do
	@rob.place(0, 0, "NORTH")
	@rob.move
	@rob.report.should eql("0,1,NORTH")
  end

  it "moves the robot forward in the EAST direction" do
	@rob.place(0, 0, "EAST")
	@rob.move
	@rob.report.should eql("1,0,EAST")
  end
  
  it "moves the robot forward in the SOUTH direction" do
	@rob.place(5, 5, "SOUTH")
	@rob.move
	@rob.report.should eql("5,4,SOUTH")
  end
  
  it "moves the robot forward in the WEST direction" do
	@rob.place(5, 5, "WEST")
	@rob.move
	@rob.report.should eql("4,5,WEST")
  end
  
  it "ignores a move that will make the robot fall off the table in the SOUTH direction" do
	@rob.place(3, 0, "SOUTH")
	@rob.move
	@rob.report.should eql("3,0,SOUTH")
  end

  it "ignores a move that will make the robot fall off the table in the WEST direction" do
	@rob.place(0, 3, "WEST")
	@rob.move
	@rob.report.should eql("0,3,WEST")
  end
  
  it "ignores a move that will make the robot fall off the table in the NORTH direction" do
	@rob.place(3, 5, "NORTH")
	@rob.move
	@rob.report.should eql("3,5,NORTH")
  end
  
  it "ignores a move that will make the robot fall off the table in the EAST direction" do
	@rob.place(5, 3, "EAST")
	@rob.move
	@rob.report.should eql("5,3,EAST")
  end
  
  it "turns the robot to the left" do
	@rob.place(0, 0, "NORTH")
	@rob.left
	@rob.report.should eql("0,0,WEST")
  end
  
  it "turns the robot to the right" do
	@rob.place(0, 0, "NORTH")
	@rob.right
	@rob.report.should eql("0,0,EAST")
  end
  
end