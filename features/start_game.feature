#encoding: utf-8

Feature: Start tictactoe game

  Scenario: Choosing Player vs Player game mode
    Given I want to play tictactoe on mode Player vs Player
    When I enter option 1
    Then I should see the tictactoe started
    And to be on Player vs Player mode

  Scenario: Choosing Player vs CPU game mode
    Given I want to play tictactoe on mode Player vs CPU
    When I enter option 2
    Then I should see the tictactoe started
    And to be on Player vs CPU mode

