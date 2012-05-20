module MindBreaker
  class Agent
    attr_accessor :goal, :problem
    
    def initialize(problem)
      @problem = problem
    end
  end
end