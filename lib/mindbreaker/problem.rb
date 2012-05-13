module Mindbreaker
  class Problem
    attr_accessor :output #TODO Remove this from the problem responsibility
    attr_accessor :configuration
    
    def initialize(output)
      @output = output
    end
    
    def greet
      @output.puts "Enter configuration:"
    end
  end
end