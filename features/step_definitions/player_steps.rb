# frozen_string_literal: true

# :nodoc:
class Input
  attr_writer :message

  def gets
    @message
  end
end

def input
  @input ||= Input.new
end

# :nodoc:
class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def feature_output
  @feature_output ||= Output.new
end

Given(/^I am not running any problem yet$/) do
end

Given(/^I am running "([^"]*)"$/) do |problem|
  @app = MindBreaker::App.new(input, feature_output, problem)
  @app.start
  @app.greet
end

When(/^I start to run "([^"]*)"$/) do |problem|
  @app = MindBreaker::App.new(input, feature_output, problem)
  @app.start
  @app.greet
end

When(/^I submit a configuration "([^"]*)"$/) do |configuration|
  input.message = configuration
  @agent = @app.create_agent
end

Then(/^I should see "([^"]*)"$/) do |message|
  feature_output.messages.should include(message)
end

Then(/^I should have an agent of "([^"]*)" type$/) do |agent_class|
  @agent.class.should == agent_class.constantize(MindBreaker)
end

Then(/^its goal should be "([^"]*)"$/) do |goal|
  @agent.goal.state.should == goal.to_sp
end

Then(/^my heuristic value should be "([^"]*)"$/) do |heuristic|
  @agent.heuristic.should == heuristic.to_i
end
