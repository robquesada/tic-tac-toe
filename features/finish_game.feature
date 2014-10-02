#encoding: utf-8

Feature: Finish the game

  Scenario: Tictactoe spaces are full
    Given I am playing tictactoe
    When all spaces are full
    Then game is over

  Scenario: Some player win
    Given I am playing tictactoe
    When I make a straigth line or diagonal
    Then game is over
