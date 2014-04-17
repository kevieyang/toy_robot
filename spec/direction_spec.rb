#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../lib/direction.rb'

describe Direction do
  it "returns the current direction" do
    dir = Direction.new("NORTH")
	dir.facing.should == "NORTH"
  end
  
  it "turns the robot left from NORTH" do
    dir = Direction.new("NORTH")
	dir.left
	dir.facing.should == "WEST"
  end
  
  it "turns the robot right from NORTH" do
    dir = Direction.new("NORTH")
	dir.right
	dir.facing.should == "EAST"
  end

  it "turns the robot left from SOUTH" do
    dir = Direction.new("SOUTH")
	dir.left
	dir.facing.should == "EAST"
  end
  
  it "turns the robot right from SOUTH" do
    dir = Direction.new("SOUTH")
	dir.right
	dir.facing.should == "WEST"
  end
  
  it "turns the robot left from EAST" do
    dir = Direction.new("EAST")
	dir.left
	dir.facing.should == "NORTH"
  end
  
  it "turns the robot right from EAST" do
    dir = Direction.new("EAST")
	dir.right
	dir.facing.should == "SOUTH"
  end
  
  it "turns the robot left from WEST" do
    dir = Direction.new("WEST")
	dir.left
	dir.facing.should == "SOUTH"
  end
  
  it "turns the robot right from WEST" do
    dir = Direction.new("WEST")
	dir.right
	dir.facing.should == "NORTH"
  end
  
  it "does not accept an invalid direction" do
    dir = Direction.new("SOUTH-WEST")
	dir.facing.should be_nil
  end
  
  it "validates a valid direction" do
    dir = Direction.new("WEST")
	dir.validate("NORTH").should == true	
  end
  
  it "invalidates an invalid direction" do
    dir = Direction.new("WEST")
	dir.validate("HELLO WORLD").should == false
  end
end