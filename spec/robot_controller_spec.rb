#!/usr/bin/ruby
require 'rubygems'
require 'rspec'
require '../robot_controller.rb'

describe RobotController do

  before(:each) do
    @rc = RobotController.new
  end
  
  context "when reading input from file" do
    it "handles the PLACE command"
    it "handles the MOVE command"
    it "handles the LEFT command"
    it "handles the RIGHT command"
    it "handles the REPORT command"
	
  end
  
  context "when in console input" do
    it "handles the PLACE command"
    it "handles the MOVE command"
    it "handles the LEFT command"
    it "handles the RIGHT command"
    it "handles the REPORT command"
  end
end