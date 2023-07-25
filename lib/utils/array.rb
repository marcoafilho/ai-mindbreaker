module Utils
  module Array
    def sum
      inject(:+)
    end

    def swap!(a, b)
      self[a], self[b] = self[b], self[a]
    end

    def zero_index
      index(0)
    end
  end
end

Array.include Utils::Array
