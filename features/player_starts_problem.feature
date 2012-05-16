Feature: player starts problem

As a player
I should be able to start any of the available problems
so that I can select a configuration

Scenario:
	Given I am not running any problem yet
	When I start to run "SlidingPuzzle"
	Then I should see "=== Welcome to SlidingPuzzle mind breaker ==="
	Then I should see "Enter configuration:"
	And I should have an "SlidingPuzzleAgent"