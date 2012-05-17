Feature: player submit configuration

In order to have a working agent
As a player 
I should be able to submit a configuration

Scenario Outline:
	Given I am running "<problem>"
	When I submit a configuration "<configuration>"
	Then I should have an agent of "<agent>" type
	And its goal should be "<goal>"
	
Scenarios:
 | problem       | configuration | agent              | goal      |
 | SlidingPuzzle | 283164705     | SlidingPuzzleAgent | 123804765 |
 | SlidingPuzzle | 473156208     | SlidingPuzzleAgent | 012345678 |
 | SlidingPuzzle | 183065724     | SlidingPuzzleAgent | 012345678 |
 | SlidingPuzzle | 708546312     | SlidingPuzzleAgent | 012345678 |
