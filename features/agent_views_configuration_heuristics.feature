Feature: agent views configuration heuristics

In order to take the best action
As an agent
I should be able to see the current configuration's heuristic function result

Scenario Outline:
	Given I am running "<problem>"
	When I submit a configuration "<configuration>"
	Then my heuristic value should be "<heuristic>"
	
Scenarios:
 | problem       | configuration | heuristic |
 | SlidingPuzzle | 283164705     | 6         |
 | SlidingPuzzle | 012345678     | 0         |
 | SlidingPuzzle | 473156208     | 20        |
 | SlidingPuzzle | 183065724     | 16        |
 | SlidingPuzzle | 708546312     | 19        |
	
