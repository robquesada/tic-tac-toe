#encoding: utf-8

Feature: Computer logic

  Scenario: Blocking horizontal line to player
    Given Computer wants to block horizontal line to player
    When Player inserts two marks in row "A" and columns 1 and 2
    Then the computer insert a mark in column 3 of the same row
