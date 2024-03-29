# frozen_string_literal: true

module MindBreaker
  # :nodoc:
  class SlidingPuzzleAgent < Agent
    attr_accessor :tree, :current_node, :frontiers, :states_explored

    def initialize(sliding_puzzle)
      @tree = Tree.new(root: { problem: sliding_puzzle })
      @current_node = @tree.root
      @current_node.function = heuristic
      @states_explored = []
    end

    def find_goal
      if initial_problem.total_lower_blocks.even?
        SlidingPuzzle.new([0, 1, 2, 3, 4, 5, 6, 7, 8])
      else
        SlidingPuzzle.new([1, 2, 3, 8, 0, 4, 7, 6, 5])
      end
    end

    def cost(node)
      node.depth + heuristic(node.problem.state)
    end

    def goal
      @goal ||= find_goal
    end

    def heuristic(state = percept.state)
      state.map { |number| count_moves(number, state) }.sum
    end

    def search(_state = goal.state)
      @frontiers = [@current_node]
      while @current_node.problem.state != goal.state
        @frontiers += expand
        @current_node = @frontiers.delete(best_choice)
        @cheapest = nil
      end
      @current_node
    end

    def expand
      current_node = @current_node
      percept.possible_actions.each do |action|
        next if @states_explored.include?(act(action))

        @current_node.add(problem: SlidingPuzzle.new(act(action)))
        current_node = @current_node.children.last
        current_node.function = cost(current_node)
      end
      @states_explored << @current_node.problem.state
      @current_node.children
    end

    def best_choice
      @frontiers.detect { |node| node.function == cheapest } || @current_node
    end

    def cheapest
      @cheapest ||= @frontiers.map(&:function).min
    end

    def act(value)
      state = percept.state.dup

      case value
      when :up then state.swap!(percept.zero_position, percept.zero_position - 3)
      when :down then state.swap!(percept.zero_position, percept.zero_position + 3)
      when :left then state.swap!(percept.zero_position, percept.zero_position - 1)
      when :right then state.swap!(percept.zero_position, percept.zero_position + 1)
      end

      state
    end

    private

    def initial_problem
      tree.root.problem
    end

    def percept
      @current_node.problem
    end

    def count_moves(number, state)
      count_row_moves(number, state) + count_column_moves(number, state)
    end

    def count_column_moves(number, state)
      (SlidingPuzzle.new(state).find(number, :column) - goal.find(number, :column)).abs
    end

    def count_row_moves(number, state)
      (SlidingPuzzle.new(state).find(number, :row) - goal.find(number, :row)).abs
    end
  end
end
