module Mindbreaker
  class SlidingPuzzle < Problem
    def define_goal
      raise MissingConfigurationError unless @configuration
      @goal = self.class.find_goal(@configuration)
    end
    
    def self.find_goal(configuration)
      if total_lower_elements(configuration) % 2 == 0
        [0, 1, 2, 3, 4, 5, 6, 7, 8]
      else
        [1, 2, 3, 8, 0, 4, 7, 6, 5]
      end
    end
    
    private
    def self.total_lower_elements(configuration)
      configuration.map do |number|
        count_lower_elements(number, remaining_configuration(number, configuration))
      end.inject(:+)
    end
    
    def self.count_lower_elements(number, configuration)
      configuration.map do |cmp_number| 
        (number > cmp_number && cmp_number != 0) ? 1 : 0 
      end.inject(:+)
    end

    def self.remaining_configuration(number, configuration)
      configuration[configuration.find_index(number)..(configuration.length-1)]
    end    
  end
end