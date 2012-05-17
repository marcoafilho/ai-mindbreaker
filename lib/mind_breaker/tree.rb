module MindBreaker
  class Tree
    attr_accessor :root

    def initialize(attrs)
      @root = Node.new(attrs[:root])
    end

    def add_node(parent, params)
      parent.add(params)
    end
  end
end