module MindBreaker
  class Agent
    attr_accessor :goal, :problem
    
    def initialize(problem, options = {})
      @problem = problem
    end
  end
end