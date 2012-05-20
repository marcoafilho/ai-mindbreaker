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
      input.gets.send(format_method)
    end
    
    def gets_max_iterations
      input.gets.chomp.to_i
    end
    
    def create_agent
      @agent = case problem
      when "SlidingPuzzle" then agent_class.new(new_problem)
      when "EightQueens"   then agent_class.new(4.times.map{ new_problem }, gets_max_iterations)
      end
    end
    
    def new_problem
      problem_class.new(gets_configuration)
    end
    
    def agent_class
      "#{problem}Agent".constantize(MindBreaker)
    end
    
    def problem_class
      problem.constantize(MindBreaker)
    end
    
    private    
    def format_method
      "to_#{problem.scan(/[A-Z]/).join.downcase}".to_sym
    end
  end
end