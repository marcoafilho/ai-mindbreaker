module Utils  
  module String
    def constantize(mod = Object)
      mod.const_get(self)
    end
    
    def to_sp
      self.chomp.split('').map(&:to_i)
    end
    
    def to_eq
      self.chomp.split('').map(&:to_i)
    end
  end
end

String.send(:include, Utils::String)