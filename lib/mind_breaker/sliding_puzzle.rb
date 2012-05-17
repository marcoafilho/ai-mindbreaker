module MindBreaker
  class SlidingPuzzle < Problem    
    ACTIONS = [:left, :right, :up, :down]
    
    def find(number, direction)
      case(direction)
      when :row then state.index(number) / 3
      when :column then state.index(number) % 3
      end
    end
    
    def zero_position(state)
      state.index(0)
    end
    
    def total_lower_blocks
      state.map{ |number| count_lower_blocks(number) }.sum
    end
    
    def count_lower_blocks(number)
      remaining_blocks(number).map{ |cmp_number| (number > cmp_number && cmp_number != 0) ? 1 : 0 }.sum
    end
        
    def find_solution
      @tree = Tree.new(state: @state, function: heuristic(state))
      root = @tree.root
      actions = possible_actions(@state.index(0))
      puts root.inspect
      actions.each do |action|
        root.add(state: move(action, @state), function: 1 + heuristic(move(action, @state)))
      end
    end
    
    def possible_actions(zero_position)
      actions = ACTIONS.dup
      
      case(zero_position/3)
      when 0 then actions.delete(:up)
      when 2 then actions.delete(:down)
      end
      
      case(zero_position % 3)
      when 0 then actions.delete(:left)
      when 2 then actions.delete(:right)
      end
      
      actions
    end
    
    def move(action, state)
      state = @state.dup

      case action
      when :up then state.swap!(zero_position(state), zero_position(state) - 3)
      when :down then state.swap!(zero_position(state), zero_position(state) + 1)
      when :left then state.swap!(zero_position(state), zero_position(state) - 1)
      when :right then state.swap!(zero_position(state), zero_position(state) + 1)
      end
      
      state
    end
                    
    private
    def remaining_blocks(number)
      state[state.find_index(number)..(state.length-1)]
    end    
  end
end