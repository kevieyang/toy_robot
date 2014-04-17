#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../lib/table.rb'
require '../lib/position.rb'

describe Table do
  
  before(:each) do
    @table = Table.new(5,5)
  end

  it "has a set size x" do
    @table.size_x.should == 5
  end

  it "has a set size y" do
    @table.size_y.should == 5
  end

  it "correctly identifies a valid position " do
	@table.validate_position(Position.new(0,2)).should == true
  end
  
  it "correctly identifies an invalid table position" do
	@table.validate_position(Position.new(6,6)).should == false
  end
  
end
