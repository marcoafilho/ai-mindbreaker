module MindBreaker
  # :nodoc:
  class Tree
    attr_accessor :root

    def initialize(attrs)
      @root = Node.new(attrs[:root])
    end

    def show
      puts "depth: #{@root.depth} function: #{@root.function.inspect} state: #{@root.problem.state.inspect}"
      @root.children.each do |grandchild|
        puts "depth: #{grandchild.depth} function: #{grandchild.function.inspect} state: #{grandchild.problem.state.inspect}"
        show_children(grandchild)
      end
    end

    def show_children(child)
      child.children.each do |grandchild|
        puts "depth: #{grandchild.depth} function: #{grandchild.function.inspect} state: #{grandchild.problem.state.inspect}"
        show_children(grandchild)
      end
    end
  end
end
