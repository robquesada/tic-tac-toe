#encoding: utf-8

Feature: Mark input in tictactoe

  Scenario: Marking player input in tictactoe
    Given I want to mark a space in the tictactoe
    When Game is not over
    And I enter "A" in the row option
    And I enter 1 in the column option
    Then I have entered a mark in the tictactoe

  Scenario: Marking computer input in tictactoe
    Given Computer wants to mark a space in the tictactoe
    When Game is not over
    And It generates entry "B" in the row option
    And It generates entry 2 in the column option
    Then the computer generated a mark in the tictactoe
