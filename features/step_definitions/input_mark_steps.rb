#encoding: utf-8
$LOAD_PATH << '.'
require 'game'
require 'board'

Given(/^I want to mark a space in the tictactoe$/) do
  @board = Fachade::Board.new
  @game = Core::Game.new
end

When(/^Game is not over$/) do
  @board.is_game_over?.should == false
end

When(/^(?:I enter|It generates entry) "(.*?)" in the row option$/) do |row|
  case row
  when "A"
    @row = 1
  when "B"
    @row = 2
  when "C"
    @row = 3
  end
end

When(/^(?:I enter|It generates entry) (\d+) in the column option$/) do |column|
  @column = column.to_i
end

Then(/^I have entered a mark in the tictactoe$/) do
  @board.player_entry(@row, @column, "X")
end

Given(/^Computer wants to mark a space in the tictactoe$/) do
  @board = Fachade::Board.new
  @game = Core::Game.new
  @computer = Computer.new(@game)
end

Then(/^the computer generated a mark in the tictactoe$/) do
  @computer.generate_computer_entry(@row, @column)
end
