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
  @app = MindBreaker::App.new(input, output, problem)
  @app.start
  @app.greet
end

When /^I start to run "([^"]*)"$/ do |problem|
  @app = MindBreaker::App.new(input, output, problem)
  @app.start
  @app.greet
end

When /^I submit a configuration "([^"]*)"$/ do |configuration|
  input.message = configuration
  @agent = @app.create_agent
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Then /^I should have an agent of "([^"]*)" type$/ do |agent_class|
  @agent.class.should == agent_class.constantize(MindBreaker)
end

Then /^its goal should be "([^"]*)"$/ do |goal|
  @agent.goal.state.should == goal.to_sp
end

Then /^my heuristic value should be "([^"]*)"$/ do |heuristic|
  @agent.heuristic.should == heuristic.to_i
end