module MindBreaker
  class Tree
    attr_accessor :root

    def initialize(attrs)
      @root = Node.new(attrs[:root])
    end
    
    def show
      puts "depth: #{@root.depth} function: #{@root.function.inspect} state: #{@root.problem.state.inspect}"
      @root.children.each do |child|
        puts "depth: #{child.depth} function: #{child.function.inspect} state: #{child.problem.state.inspect}"
        show_children(child)
      end
    end
    
    def show_children(child)
      child.children.each do |child|
        puts "depth: #{child.depth} function: #{child.function.inspect} state: #{child.problem.state.inspect}"        
        show_children(child)
      end
    end
  end
end