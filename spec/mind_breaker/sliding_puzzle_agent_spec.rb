# frozen_string_literal: true

require 'spec_helper'

module MindBreaker
  describe SlidingPuzzleAgent do
    describe '#goal' do
      context 'with an even state' do
        let(:sliding_puzzle) { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'has a linear goal' do
          expect(sliding_puzzle_agent.goal.state).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
        end
      end

      context 'with an odd state' do
        let(:sliding_puzzle) { SlidingPuzzle.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'has a circular goal' do
          expect(sliding_puzzle_agent.goal.state).to eq([1, 2, 3, 8, 0, 4, 7, 6, 5])
        end
      end
    end

    describe '#heuristic' do
      context 'with a linear goal' do
        let(:sliding_puzzle) { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'has a heuristic value' do
          expect(sliding_puzzle_agent.heuristic).to eq(20)
        end
      end

      context 'with a circular goal' do
        let(:sliding_puzzle) { SlidingPuzzle.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'has a heuristic value' do
          expect(sliding_puzzle_agent.heuristic).to eq(6)
        end
      end
    end

    describe '#search' do
      context 'with linear goal as initial state' do
        let(:sliding_puzzle) { SlidingPuzzle.new([0, 1, 2, 3, 4, 5, 6, 7, 8]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'returns the same state' do
          expect(sliding_puzzle_agent.search.problem.state).to eq(sliding_puzzle.state)
        end
      end

      context 'with circular goal as initial state' do
        let(:sliding_puzzle) { SlidingPuzzle.new([1, 2, 3, 8, 0, 4, 7, 6, 5]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'returns the same state' do
          expect(sliding_puzzle_agent.search.problem.state).to eq(sliding_puzzle.state)
        end
      end

      context 'with an even initial state ([7, 0, 8, 5, 4, 6, 3, 1, 2])' do
        let(:sliding_puzzle) { SlidingPuzzle.new([7, 0, 8, 5, 4, 6, 3, 1, 2]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'returns the goal state' do
          expect(sliding_puzzle_agent.search.problem.state).to eq(sliding_puzzle_agent.goal.state)
        end

        it 'has current node as goal state' do
          sliding_puzzle_agent.search
          expect(sliding_puzzle_agent.current_node.problem.state).to eq(sliding_puzzle_agent.goal.state)
        end
      end

      context 'with another even initial state ([4, 7, 3, 1, 5, 6, 2, 0, 8])' do
        let(:sliding_puzzle) { SlidingPuzzle.new([4, 7, 3, 1, 5, 6, 2, 0, 8]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'returns the goal state' do
          expect(sliding_puzzle_agent.search.problem.state).to eq(sliding_puzzle_agent.goal.state)
        end

        it 'has current node as goal state' do
          sliding_puzzle_agent.search
          expect(sliding_puzzle_agent.current_node.problem.state).to eq(sliding_puzzle_agent.goal.state)
        end
      end

      context 'with an odd initial state' do
        let(:sliding_puzzle) { SlidingPuzzle.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }
        let(:sliding_puzzle_agent) { described_class.new(sliding_puzzle) }

        it 'returns the goal state' do
          expect(sliding_puzzle_agent.search.problem.state).to eq(sliding_puzzle_agent.goal.state)
        end

        it 'has current node as goal state' do
          sliding_puzzle_agent.search
          expect(sliding_puzzle_agent.current_node.problem.state).to eq(sliding_puzzle_agent.goal.state)
        end
      end
    end
  end
end
