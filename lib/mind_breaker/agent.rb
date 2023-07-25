module MindBreaker
  class Agent
    attr_accessor :goal, :problem

    def initialize(problem, options = {})
      @problem = problem
      start_problem
      options.each do |key, value|
        send("#{key}=".to_sym, value)
      end
    end

    def start_problem
      @start_problem ||= @problem
    end
  end
end
