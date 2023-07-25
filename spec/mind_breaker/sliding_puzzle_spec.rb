# frozen_string_literal: true

require 'spec_helper'

module MindBreaker
  describe SlidingPuzzle do
    describe '#total_lower_blocks' do
      context 'with the state [4, 7, 3, 1, 5, 6, 2, 0, 8]' do
        let(:sliding_puzzle) { described_class.new([4, 7, 3, 1, 5, 6, 2, 0, 8]) }

        it 'returns 12' do
          expect(sliding_puzzle.total_lower_blocks).to equal(12)
        end
      end
    end

    describe '#count_lower_blocks' do
      context 'with the state [2, 8, 3, 1, 6, 4, 7, 0, 5]' do
        let(:sliding_puzzle) { described_class.new([2, 8, 3, 1, 6, 4, 7, 0, 5]) }

        it 'returns 0 for number 0' do
          expect(sliding_puzzle.count_lower_blocks(0)).to equal(0)
        end

        it 'returns 0 for number 1' do
          expect(sliding_puzzle.count_lower_blocks(1)).to equal(0)
        end

        it 'returns 1 for number 2' do
          expect(sliding_puzzle.count_lower_blocks(2)).to equal(1)
        end

        it 'returns 1 for number 3' do
          expect(sliding_puzzle.count_lower_blocks(3)).to equal(1)
        end

        it 'returns 0 for number 4' do
          expect(sliding_puzzle.count_lower_blocks(4)).to equal(0)
        end

        it 'returns 0 for number 5' do
          expect(sliding_puzzle.count_lower_blocks(5)).to equal(0)
        end

        it 'returns 2 for number 6' do
          expect(sliding_puzzle.count_lower_blocks(6)).to equal(2)
        end

        it 'returns 1 for number 7' do
          expect(sliding_puzzle.count_lower_blocks(7)).to equal(1)
        end

        it 'returns 6 for number 8' do
          expect(sliding_puzzle.count_lower_blocks(8)).to equal(6)
        end
      end
    end
  end
end
