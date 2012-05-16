Feature: Agent move blocks

  In order to change the configuration of the puzzle
  As an agent
  I want to swap the values of my configuration

Scenario Outline:
	Given I am playing "SlidingPuzzle"
	When I submit a configuration "<configuration>"
	And I move the block "<side>"
	Then my new configuration should be "<configuration>"
	
Scenarios:
 | configuration | side | configuration |
