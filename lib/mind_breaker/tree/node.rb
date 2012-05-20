module MindBreaker
  class Tree
    class Node
      attr_reader :children, :parent, :depth
      attr_accessor :problem, :function
      
      def initialize(attrs)
        @children = attrs[:children] || []
        @depth = attrs[:depth] || 0
        @parent   = attrs[:parent]
        @problem  = attrs[:problem]
      end
            
      def add(attrs)
        @children.push Node.new(attrs.merge(parent: self, depth: @depth + 1))
      end
      
      def cheapest
        @children.map(&:function).min
      end
    end
  end
end