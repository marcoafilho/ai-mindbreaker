module MindBreaker
  class EightQueens < Problem 
    attr_accessor :probability # TODO Find a better place to store probability!
    
    def goal
      28
    end
    
    def goal?
      @fitness == 28
    end
    
    # TODO Deixar esse método mais bonitinho!!!
    def fitness
      @fitness ||= goal - count_attackers
    end

    # TODO Deixar esse método mais bonitinho!!!
    def count_attackers
      count = 0      
      for i in 0..6
        for j in (i+1)..7
          if @state[i] == @state[j]
            count += 1
          elsif (i - j).abs == (@state[i] - @state[j]).abs
            count += 1
          end
        end
      end
      count
    end
  end
end