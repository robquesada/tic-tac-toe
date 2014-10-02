#encoding: utf-8
$LOAD_PATH << '.'
require 'computer'
require 'game'

Given(/^Computer wants to block (?:horizontal|vertical|diagonal) line to player$/) do
  @game = Core::Game.new
  @computer = Computer.new(@game)
end

When(/^Player inserts a mark in row "(.*?)" and column (\d+)$/) do |row, column|
  case row
  when "A"
    @row = 1
  when "B"
    @row = 2
  when "C"
    @row = 3
  end
  @column = column.to_i
  @game.player_entry(@row, @column, "X")
end

When(/^Player inserts another mark in the same row but column (\d+)$/) do |column2|
  @column2 = column2.to_i
  @game.player_entry(@row, @column2, "X")
end

Then(/^the computer inserts a mark in the empty column of that row$/) do
  @computer.block_player_horizontal(@row, @column2).should == true
end

When(/^Player inserts another mark in the same column but row "(.*?)"$/) do |row2|
  case row2
  when "A"
    @row2 = 1
  when "B"
    @row2 = 2
  when "C"
    @row2 = 3
  end
  @game.player_entry(@row2, @column, "X")
end

Then(/^the computer inserts a mark in the empty row of that column$/) do
  @computer.block_player_vertical(@row2, @column).should == true
end

Then(/^the computer inserts a mark in the empty space that forms a diagonal$/) do
  @computer.block_player_diagonal.should == true
end
