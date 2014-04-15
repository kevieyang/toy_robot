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

  it "has a set width" do
    table = Table.new(5,5)
    table.width.should == 5
  end

  it "has a set length" do
    table = Table.new(5,5)
    table.width.should == 5
  end

  it "validates (0,3)" do
    table = Table.new(5,5)
	table.validate_position(Position.new(0,3)).should == true
  end

  it "validates (4,4)" do
    table = Table.new(5,5)
	table.validate_position(Position.new(4,4)).should == true
  end
  
  it "invalidates (-1,3)" do
    table = Table.new(5,5)
	table.validate_position(Position.new(-1,3)).should == false
  end
  
  it "invalidates (2,-2)" do
    table = Table.new(5,5)
	table.validate_position(Position.new(2,-2)).should == false
  end
end
