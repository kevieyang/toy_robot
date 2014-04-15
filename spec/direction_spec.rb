#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../direction.rb'

describe Direction do
  it "returns the current direction" do
    dir = Direction.new("NORTH")
	dir.facing.should == "NORTH"
  end
  
  it "turns the robot left" do
    dir = Direction.new("NORTH")
	dir.left
	dir.facing.should == "WEST"
  end
  
  it "turns the robot right" do
    dir = Direction.new("NORTH")
	dir.right
	dir.facing.should == "EAST"
  end

end