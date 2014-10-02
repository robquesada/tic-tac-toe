#encoding: utf-8

Feature: Computer logic

  Scenario: Blocking horizontal line to player
    Given Computer wants to block horizontal line to player
    When Player inserts a mark in row "A" and column 1
    And Player inserts another mark in the same row but column 2
    Then the computer inserts a mark in the empty column of that row

  Scenario: Blocking vertical line to player
    Given Computer wants to block vertical line to player
    When Player inserts a mark in row "A" and column 1
    And Player inserts another mark in the same column but row "B"
    Then the computer inserts a mark in the empty row of that column

  Scenario: Blocking diagonal line to player
    Given Computer wants to block diagonal line to player
    When Player inserts a mark in row "A" and column 1
    And Player inserts a mark in row "B" and column 2
    Then the computer inserts a mark in the empty space that forms a diagonal
