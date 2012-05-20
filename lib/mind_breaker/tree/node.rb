module MindBreaker
  class Tree
    class Node
      attr_reader :children, :depth, :parent
      attr_accessor :problem, :function
      
      def initialize(attrs)
        @children = attrs[:children] || []
        @depth = attrs[:depth] || 0
        @parent = attrs[:parent]
        @problem  = attrs[:problem]
      end
            
      def add(attrs)
        @children.push Node.new(attrs.merge(parent: self, depth: @depth + 1))
      end
      
      def show_steps
        grid = build_grid
        grid.reverse.each do |node|
          show(node)
        end
      end
      
      def build_grid
        steps = [self]
        node = self
        @depth.times do
          steps << node.parent
          node = node.parent
        end
        
        steps
      end
      
      def show(node)
        print " - - - \n"
        node.problem.state.each do |block|
          print "|" + block.to_s
          print "|\n" if node.problem.state.index(block) % 3 == 2
        end
        print " - - - \n"
      end
    end
  end
end