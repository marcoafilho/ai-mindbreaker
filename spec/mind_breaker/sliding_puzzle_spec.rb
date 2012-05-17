require "spec_helper"

module MindBreaker
  describe SlidingPuzzle do
    describe "#total_lower_blocks" do
      context "with the state [4, 7, 3, 1, 5, 6, 2, 0, 8]" do
        let(:sliding_puzzle)   { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8]) }
        
        it "returns 12" do
          sliding_puzzle.total_lower_blocks.should == 12
        end
      end
    end
    
    describe "#count_lower_blocks" do
      context "with the state [2, 8, 3, 1, 6, 4, 7, 0, 5]" do
        let(:sliding_puzzle)   { SlidingPuzzle.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }
        
        it "returns 0 for number 0" do
          sliding_puzzle.count_lower_blocks(0).should == 0
        end
        
        it "returns 0 for number 1" do
          sliding_puzzle.count_lower_blocks(1).should == 0
        end
        
        it "returns 1 for number 2" do
          sliding_puzzle.count_lower_blocks(2).should == 1
        end

        it "returns 1 for number 3" do
          sliding_puzzle.count_lower_blocks(3).should == 1
        end
        
        it "returns 0 for number 4" do
          sliding_puzzle.count_lower_blocks(4).should == 0
        end
        
        it "returns 0 for number 5" do
          sliding_puzzle.count_lower_blocks(5).should == 0
        end
        
        it "returns 2 for number 6" do
          sliding_puzzle.count_lower_blocks(6).should == 2
        end
        
        it "returns 1 for number 7" do
          sliding_puzzle.count_lower_blocks(7).should == 1
        end
        
        it "returns 6 for number 8" do
          sliding_puzzle.count_lower_blocks(8).should == 6
        end
      end
    end
    
    describe "#heuristic" do
      let(:sliding_puzzle) { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8])}
            
      context "with a linear goal" do
        before(:each) do
          # sliding_puzzle.state = [4, 7, 3, 1, 5, 6, 2, 0, 8]
        end
        
        it "has a heuristic value" do
          pending("Moving this to agent class")
          sliding_puzzle.heuristic.should == 20
        end
      end
      
      context "with a circular goal" do
        before(:each) do
          # sliding_puzzle.state = [2, 8, 3, 1, 6, 4, 7, 0, 5]
        end
        
        it "has a heuristic value" do
          pending("Moving this to agent class")
          sliding_puzzle.heuristic.should == 6
        end
      end
    end
  end
end