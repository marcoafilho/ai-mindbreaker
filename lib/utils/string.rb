module Utils  
  module String
    def to_sp
      self.chop.split('').collect(&:to_i)
    end
  end
end

String.send(:include, Utils::String)