#encoding: utf-8
$LOAD_PATH << '.'
require 'board'

Given(/^I am playing tictactoe$/) do
  @board = Fachade::Board.new
end

When(/^all spaces are full$/) do
  @board.get_tictactoe.each do |space|
    space << "X"
  end
end

Then(/^game is over$/) do
  @board.is_game_over?.should == true
end

When(/^I make a straigth line or diagonal$/) do
  for i in 1..3
    @board.get_tictactoe[1,i] << "X"
  end
end
