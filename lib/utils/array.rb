module Utils
  module Array
    def swap!(a,b)
      self[a], self[b] = self[b], self[a]
    end
    
    def sum
      self.inject(:+)
    end
  end
end

Array.send(:include, Utils::Array)