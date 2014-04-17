#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../lib/table.rb'
require '../lib/position.rb'

describe Table do

  it "creates table" do
    table = Table.new(5,5)
	table.class.should equal(Table)
  end

  it "has a set size x" do
    table = Table.new(1,2)
    table.size_x.should == 1
  end

  it "has a set size y" do
    table = Table.new(1,2)
    table.size_y.should == 2
  end

  it "correctly identifies a valid position " do
    table = Table.new(5,5)
	table.validate_position(Position.new(0,2)).should == true
  end
  
  it "correctly identifies an invalid table position" do
    table = Table.new(5,5)
	table.validate_position(Position.new(6,6)).should == false
  end
  
end
