#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../position.rb'

describe Position do

  it "returns position x" do
    pos = Position.new(0, 1)
    pos.x.should == 0
  end

  it "returns position y" do
    pos = Position.new(0, 1)
    pos.y.should == 1
  end
  
end