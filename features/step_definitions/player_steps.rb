class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given /^I am not running any problem yet$/ do
end

Given /^I am running "([^"]*)"$/ do |problem|
  @sliding_puzzle = Mindbreaker::SlidingPuzzle.new(output)
end

When /^I start to run "([^"]*)"$/ do |problem|
  @sliding_puzzle = Mindbreaker::SlidingPuzzle.new(output)
  @sliding_puzzle.greet
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

When /^I submit a configuration "([^"]*)"$/ do |configuration|
  @sliding_puzzle.configuration = configuration.to_sp
end

Then /^my goal should be "([^"]*)"$/ do |goal|
  @sliding_puzzle.goal.should == goal.to_sp
end

Then /^my heuristic value should be "([^"]*)"$/ do |heuristic|
  @sliding_puzzle.heuristic.should == heuristic.to_i
end