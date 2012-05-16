class Input  
  attr_writer :message
    
  def gets
    @message
  end
end

def input
  @input ||= Input.new
end

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
  @problem = MindBreaker::App.new(input, output, problem)
  @problem.start
  @problem.greet
end

When /^I start to run "([^"]*)"$/ do |problem|
  @problem = MindBreaker::App.new(input, output, problem)
  @problem.start
  @problem.greet
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