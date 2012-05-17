module MindBreaker
  class SlidingPuzzleAgent < Agent
    attr_accessor :tree, :current_node
        
    def initialize(sliding_puzzle)
      @tree = Tree.new(root: { problem: sliding_puzzle })
      @current_node = @tree.root
    end
    
    def find_goal
      if (initial_problem.total_lower_blocks) % 2 == 0
        SlidingPuzzle.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
      else
        SlidingPuzzle.new([1, 2, 3, 8, 0, 4, 7, 6, 5])
      end
    end
    
    def goal
      @goal ||= find_goal
    end
    
    def heuristic
      sense.state.map{ |number| count_moves(number) }.sum
    end
    
    def search(state=goal.state)
      if sense.state == goal.state
        sense
      end
    end
            
    private
    def initial_problem
      tree.root.problem
    end
    
    def sense
      current_node.problem
    end

    def count_moves(number)
      count_row_moves(number) + count_column_moves(number)
    end

    def count_column_moves(number)
      (sense.find(number, :column) - goal.find(number, :column)).abs
    end
    
    def count_row_moves(number)
      (sense.find(number, :row) - goal.find(number, :row)).abs
    end    
  end
end