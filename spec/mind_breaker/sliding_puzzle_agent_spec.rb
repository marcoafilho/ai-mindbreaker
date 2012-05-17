require "spec_helper"

module MindBreaker
  describe SlidingPuzzleAgent do    
    describe "#goal" do
      context "with an even configuration" do
        let(:sliding_puzzle) { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8]) }
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a linear goal" do
          sliding_puzzle_agent.goal.should == [0, 1, 2, 3, 4, 5, 6, 7, 8]
        end
      end
      
      context "with an odd configuration" do
        let(:sliding_puzzle) { SlidingPuzzle.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }
        let(:sliding_puzzle_agent) { SlidingPuzzleAgent.new(sliding_puzzle) }
        
        it "has a circular goal" do
          sliding_puzzle_agent.goal.should == [1, 2, 3, 8, 0, 4, 7, 6, 5]
        end
      end
    end
  end
end