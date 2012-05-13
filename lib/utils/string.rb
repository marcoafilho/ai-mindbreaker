module Utils  
  module String
    def to_sp
      self.chomp.split('').map(&:to_i)
    end
  end
end

String.send(:include, Utils::String)