module MindBreaker
  class SlidingPuzzleAgent < Agent
    attr_accessor :tree, :current_node
    
    def initialize(sliding_puzzle)
      @tree = Tree.new(root: { problem: sliding_puzzle })
    end
    
    def find_goal
      if (initial_problem.total_lower_blocks) % 2 == 0
        [0, 1, 2, 3, 4, 5, 6, 7, 8]
      else
        [1, 2, 3, 8, 0, 4, 7, 6, 5]
      end
    end
    
    def goal
      @goal ||= find_goal
    end
    
    private
    def initial_problem
      tree.root.problem
    end
  end
end