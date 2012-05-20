module MindBreaker
  class SlidingPuzzle < Problem    
    def find(number, direction)
      case(direction)
      when :row then state.index(number) / 3
      when :column then state.index(number) % 3
      end
    end
    
    def zero_position
      @state.index(0)
    end
    
    def total_lower_blocks
      @state.map{ |number| count_lower_blocks(number) }.sum
    end
    
    def count_lower_blocks(number)
      remaining_blocks(number).map{ |cmp_number| (number > cmp_number && cmp_number != 0) ? 1 : 0 }.sum
    end
            
    def possible_actions(index = @state.index(0))
      horizontal_actions(index) + vertical_actions(index)
    end
                    
    private
    def remaining_blocks(number)
      @state[@state.find_index(number)..(@state.length-1)]
    end
    
    def horizontal_actions(index)
      case(index % 3)
      when 0 then [:right]
      when 1 then [:left, :right]
      when 2 then [:left]
      end
    end
    
    def vertical_actions(index)
      case(index/3)
      when 0 then [:down]
      when 1 then [:up, :down]
      when 2 then [:up]
      end
    end    
  end
end