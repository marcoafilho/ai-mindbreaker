# frozen_string_literal: true

module MindBreaker
  # :nodoc:
  class Problem
    attr_reader :state

    def initialize(state)
      @state = state
    end
  end
end
