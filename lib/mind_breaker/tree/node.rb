module MindBreaker
  class Tree
    class Node
      attr_accessor :children, :parent
      attr_accessor :problem
      
      def initialize(attrs)
        @children = attrs[:children]
        @parent   = attrs[:parent]
        @problem  = attrs[:problem]
      end

      def create_method(name, &block)
        self.class.send(:define_method, name, &block)
      end
            
      def add(attrs)
        children.push Node.new(attrs.merge(parent: self))
      end
    end
  end
end