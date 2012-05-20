module Utils
  module Array
    def sum
      self.inject(:+)
    end
    
    def swap!(a,b)
      self[a], self[b] = self[b], self[a]
    end
        
    def zero_index
      self.index(0)
    end
  end
end

Array.send(:include, Utils::Array)