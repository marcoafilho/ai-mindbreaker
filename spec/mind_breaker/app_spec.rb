# frozen_string_literal: true

require 'spec_helper'

module MindBreaker
  describe App do
    let(:input) { double('input').as_null_object }
    let(:output) { double('output').as_null_object }

    context 'Running SlidingPuzzle' do
      let(:sliding_puzzle) { App.new(input, output, 'SlidingPuzzle') }

      describe '#start' do
        it 'sends welcome message' do
          allow(output).to receive(:puts).and_return('Welcome to SlidingPuzzle!')
          sliding_puzzle.start
        end
      end

      describe '#greet' do
        it 'prompts the inital configuration' do
          output.should_receive(:puts).with('Enter configuration: ')
          sliding_puzzle.greet
        end
      end

      describe '#gets_configuration' do
        it 'returns the user typed value' do
          value = '012345678'
          input.should_receive(:gets).and_return(value)
          expect(sliding_puzzle.gets_configuration).to eq(value.to_sp)
        end
      end

      describe '#create_agent' do
        it 'returns a new agent' do
          expect(sliding_puzzle.create_agent).to be_an_instance_of(SlidingPuzzleAgent)
        end
      end
    end
  end
end
