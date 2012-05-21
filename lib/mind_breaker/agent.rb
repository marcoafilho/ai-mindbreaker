module MindBreaker
  class Agent
    attr_accessor :goal, :problem
    
    def initialize(problem, options = {})
      @problem = problem
      options.each do |key, value|
        send("#{key}=".to_sym, value)
      end
    end
  end
end