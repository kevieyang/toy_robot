#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../table.rb'
require '../position.rb'

describe Table do

  it "creates table" do
    table = Table.new(5,5)
	table.class.should eql(Table)
  end

  it "has a width" do
    table = Table.new(5,5)
    table.width.should == 5
  end

  it "has a length" do
    table = Table.new(5,5)
    table.width.should == 5
  end

  it "checks if a valid position" do
    table = Table.new(5,5)
	table.validate_position(Position.new(0,0)).should == true
	table.validate_position(Position.new(0,5)).should == true
	table.validate_position(Position.new(5,2)).should == true
	table.validate_position(Position.new(0,3)).should == true
	table.validate_position(Position.new(4,4)).should == true
  end
  
  it "checks if an invalid position" do
    table = Table.new(5,5)
	table.validate_position(Position.new(6,6)).should == false
	table.validate_position(Position.new(6,0)).should == false
	table.validate_position(Position.new(1,6)).should == false
	table.validate_position(Position.new(-1,3)).should == false
	table.validate_position(Position.new(2,-2)).should == false
  end
end
