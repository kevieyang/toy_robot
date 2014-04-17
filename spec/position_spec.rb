#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../lib/position.rb'

describe Position do

  before(:each) do
    @pos = Position.new(0, 1)
  end
  it "returns position x" do
    @pos.x.should == 0
  end

  it "returns position y" do
    @pos.y.should == 1
  end
  
  it "sets position x" do
    @pos.x = 3
	@pos.x.should == 3
  end
  
  it "sets position y" do
    @pos.y = 3
	@pos.y.should == 3
  end
  
  it "can place a new position" do
	@pos.place(2,4)
	@pos.x.should == 2
	@pos.y.should == 4
  end
  
end