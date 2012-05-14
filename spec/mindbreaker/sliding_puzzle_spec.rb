require "spec_helper"

module Mindbreaker
  describe SlidingPuzzle do
    let(:output) { double('output').as_null_object }
    let(:sliding_puzzle)   { SlidingPuzzle.new(output) }

    describe "#greet" do
      it "sends welcome message" do
        output.should_receive(:puts).with('Enter configuration:')
        sliding_puzzle.greet
      end
    end
    
    describe "#define_goal" do
      context "with no configuration" do
        it "raises a missing configuration error" do
          lambda{ sliding_puzzle.define_goal }.should raise_error(Problem::MissingConfigurationError)
        end
      end
            
      context "with an even configuration" do
        before(:each) do
          sliding_puzzle.configuration = [4, 7, 3, 1, 5, 6, 2, 0, 8]
        end
        
        it "has a linear goal" do
          sliding_puzzle.goal.should == [0, 1, 2, 3, 4, 5, 6, 7, 8]
        end
      end
      
      context "with an odd configuration" do
        before(:each) do
          sliding_puzzle.configuration = [2, 8, 3, 1, 6, 4, 7, 0, 5]
        end
        
        it "has a circular goal" do
          sliding_puzzle.goal.should == [1, 2, 3, 8, 0, 4, 7, 6, 5]
        end
      end
    end
    
    describe "#heuristic" do
      context "with no configuration" do
        it "raises a missing configuration error" do
          lambda{ sliding_puzzle.define_goal }.should raise_error(Problem::MissingConfigurationError)
        end
      end
      
      context "with a linear goal" do
        before(:each) do
          sliding_puzzle.configuration = [4, 7, 3, 1, 5, 6, 2, 0, 8]
        end
        
        it "has a heuristic value" do
          sliding_puzzle.heuristic.should == 20
        end
      end
      
      context "with a circular goal" do
        before(:each) do
          sliding_puzzle.configuration = [2, 8, 3, 1, 6, 4, 7, 0, 5]
        end
        
        it "has a heuristic value" do
          sliding_puzzle.heuristic.should == 6
        end
      end
    end
  end
end