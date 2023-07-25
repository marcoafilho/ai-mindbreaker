# frozen_string_literal: true

module MindBreaker
  # :nodoc:
  class EightQueensAgent < Agent
    attr_accessor :max_iterations, :probability

    def initialize(problem, options = {})
      super(problem, options)
      @max_iterations ||= 25_000
      @probability ||= 0.5
    end

    def search
      fitness_probability
      iteration = 0

      while iteration != max_iterations && !goal
        crossover
        mutation
        fitness_probability
        iteration += 1
      end

      goal
    end

    def goal
      @problem.detect { |individual| individual.fitness == 28 }
    end

    def fitness_probability
      @problem.each do |individual|
        individual.probability = (individual.fitness**2).to_f / total_fitness.to_f
      end
    end

    def crossover
      new_problem = selection.map do |individual|
        EightQueens.new(individual.state)
      end
      random = rand * 7
      resolution1 = selection[0].state[0..random] + selection[1].state[random + 1..7]
      new_problem.push(EightQueens.new(resolution1))
      random = rand * 7
      resolution2 = selection[1].state[0..random] + selection[0].state[random + 1..7]
      new_problem.push(EightQueens.new(resolution2))
      @problem = new_problem
    end

    def mutation
      @problem.each do |individual|
        individual.state.each_with_index do |index, gene|
          next unless rand < 0.5

          const = (rand * 7).round
          const = (rand * 7).round while gene == @probability
          individual.state[index] = const
        end
      end
    end

    def selection
      @problem.sort_by(&:probability).reverse[0..1]
    end

    def total_fitness
      @problem.map { |individual| individual.fitness**2 }.sum
    end
  end
end
