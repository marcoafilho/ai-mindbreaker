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

      def chosen_path
        node_path.reverse
      end

      def node_path(node = self)
        node.parent ? [node] + node_path(node.parent) : [node]
      end
    end
  end
end
