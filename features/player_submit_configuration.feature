Feature: player submit configuration

In order to have a goal state
As a player 
I should be able to submit a configuration

Scenario Outline:
	Given I am running "<problem>"
	When I submit a configuration "<configuration>"
	Then my goal should be "<goal>"
	
Scenarios:
	| problem       | configuration | goal      |
	| SlidingPuzzle | 283164705 		| 123804765	|
	| SlidingPuzzle | 473156208 		| 012345678 |
	| SlidingPuzzle | 183065724 		| 012345678 |
	| SlidingPuzzle | 708546312 		| 012345678 |