module MindBreaker
  class EightQueensAgent < Agent
    attr_reader :max_iterations
    attr_accessor :population
    
    def initialize(population, max_iterations = 500)
      @population = population
      @max_iterations = max_iterations
    end
    
    def search
      fitness_probability
      iteration = 0
      
      while iteration != max_iterations && !goal
        puts "#{iteration}: #{@population.map{|i| i.state.inspect + i.probability.to_s}.inspect}"
        crossover
        mutation
        fitness_probability
        iteration += 1
      end
      
      puts goal.state.inspect if goal
    end
        
    def goal
      @population.detect{ |individual| individual.fitness == 28 }
    end
    
    def fitness_probability
      @population.each do |individual|
        individual.probability = (individual.fitness ** 2).to_f/total_fitness.to_f
      end
    end
    
    def crossover
      new_population = selection.map do |individual|
        EightQueens.new(individual.state)
      end
      random = rand * 7
      resolution1 = selection[0].state[0..random] + selection[1].state[random+1..7]
      new_population.push(EightQueens.new(resolution1))
      random = rand * 7      
      resolution2 = selection[1].state[0..random] + selection[0].state[random+1..7]
      new_population.push(EightQueens.new(resolution2))
      @population = new_population
    end
    
    def mutation
      @population.each do |individual|
        individual.state.each_with_index do |index, gene|
          if rand < 0.5
            const = (rand*7).round
            while gene == const
              const = (rand*7).round
            end
            individual.state[index] = const
          end
        end
      end
    end
      
    def selection
      @population.sort_by(&:probability).reverse[0..1]
    end
    
    def total_fitness
      @population.map{ |individual| individual.fitness ** 2 }.sum
    end
  end
end