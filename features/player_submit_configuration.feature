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
	| SlidingPuzzle | 2831647_5 		| 1238_4765	|
	| SlidingPuzzle | 4731562_8 		| 12345678_ |
	| SlidingPuzzle | 183_65724 		| 12345678_ |	
	| SlidingPuzzle | 7_8546312 		| 12345678_ |	