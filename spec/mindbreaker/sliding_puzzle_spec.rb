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
  end
end