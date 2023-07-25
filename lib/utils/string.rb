module Utils
  module String
    def constantize(mod = Object)
      mod.const_get(self)
    end

    def to_sp
      chomp.chars.map(&:to_i)
    end

    def to_eq
      chomp.chars.map(&:to_i)
    end
  end
end

String.include Utils::String
