module MindBreaker
  class App
    attr_accessor :input, :output
    attr_accessor :agent, :problem
    
    def initialize(input, output, problem)
      @input = input
      @output = output
      @problem = problem
    end
    
    def start
      output.puts "Welcome to #{problem}!" 
    end

    def greet
      output.puts "Enter configuration: "
    end
    
    def gets_configuration
      input.gets.to_sp
    end
    
    def create_agent
      @agent = agent_class.new(problem_class.new(gets_configuration))
    end
    
    def agent_class
      "#{problem}Agent".constantize(MindBreaker)
    end
    
    def problem_class
      problem.constantize(MindBreaker)
    end
  end
end