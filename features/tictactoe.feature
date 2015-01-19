#encoding: utf-8
#Feature: Showcase the simplest possible Cucumber scenario
#  Scenario: Cutting vegetables
#    Given a cucumber that is 30 cm long
#    When I cut it in halves
#    Then I have two cucumbers
#    And both are 15 cm long

Feature: Start tictactoe game
  Scenario: Choosing Player vs Player game mode
    Given I want to play tictactoe on mode Player vs Player
    When I enter option 1
    Then I should see the tictactoe started
    And to be on Player vs Player mode
