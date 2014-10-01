#encoding: utf-8
Feature: Showcase the simplest possible Cucumber scenario
  Scenario: Cutting vegetables
    Given a cucumber that is 30 cm long
    When I cut it in halves
    Then I have two cucumbers
    And both are 15 cm long
