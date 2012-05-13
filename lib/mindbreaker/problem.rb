module Mindbreaker
  class Problem
    # Error list
    class MissingConfigurationError < StandardError; end
    
    attr_accessor :output #TODO Remove this from the problem responsibility
    attr_accessor :configuration
    attr_accessor :goal
    
    def initialize(output)
      @output = output
    end
    
    def greet
      @output.puts "Enter configuration:"
    end
    
    def configuration=(configuration)
      @configuration = configuration
      define_goal
    end
  end
end