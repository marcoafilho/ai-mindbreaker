require "spec_helper"

module MindBreaker
  describe SlidingPuzzleAgent do    
    describe "#goal" do
      context "with an even state" do
        let(:sliding_puzzle) { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8]) }
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a linear goal" do
          sliding_puzzle_agent.goal.state.should == [0, 1, 2, 3, 4, 5, 6, 7, 8]
        end
      end
      
      context "with an odd state" do
        let(:sliding_puzzle) { SlidingPuzzle.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a circular goal" do
          sliding_puzzle_agent.goal.state.should == [1, 2, 3, 8, 0, 4, 7, 6, 5]
        end
      end
    end
    
    describe "#heuristic" do   
      context "with a linear goal" do
        let(:sliding_puzzle) { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8])}
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a heuristic value" do
          sliding_puzzle_agent.heuristic.should == 20
        end
      end
      
      context "with a circular goal" do
        let(:sliding_puzzle) { SlidingPuzzle.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a heuristic value" do
          sliding_puzzle_agent.heuristic.should == 6
        end
      end
    end
    
    describe "#search" do
      context "with linear goal as initial state" do
        let(:sliding_puzzle) { SlidingPuzzle.new([0, 1, 2, 3, 4, 5, 6, 7, 8])}
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a heuristic value" do
          sliding_puzzle_agent.search.should == sliding_puzzle
        end
      end
      
      context "with circular goal as initial state" do
        let(:sliding_puzzle) { SlidingPuzzle.new([1, 2, 3, 8, 0, 4, 7, 6, 5])}
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a heuristic value" do
          sliding_puzzle_agent.search.should == sliding_puzzle
        end
      end
      
      context "with an even initial state" do
        pending "Case needs to be implemented"
      end
      
      context "with an odd initial state" do
        pending "Case needs to be implemented"
      end
    end
  end
end