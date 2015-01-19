#encoding: utf-8
$LOAD_PATH << '.'
require 'game'
require 'computer'
require 'board'

Given(/^I want to play tictactoe on mode Player vs Player$/) do
  @board = nil
end

When(/^I enter option (\d+)$/) do |option|
  @board = Fachade::Board.new
  @game = Core::Game.new
  @board.computer = nil
end

Then(/^I should see the tictactoe started$/) do
  @game.should_not == nil
end

Then(/^to be on Player vs Player mode$/) do
  @board.computer.should == nil
end
