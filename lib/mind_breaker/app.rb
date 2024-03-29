# frozen_string_literal: true

module MindBreaker
  # This class is responsible for input/output and for the application flow.
  # It is the one that instantiates the proble and the smart agent.
  class App
    SLIDING_PUZZLE = 'SlidingPuzzle'
    EIGHT_QUEENS = 'EightQueens'

    attr_accessor :input, :output, :agent, :problem

    def initialize(input, output, problem, options = {})
      @input = input
      @output = output
      @problem = problem
      @options = options
    end

    def start
      output.puts "Welcome to #{problem}!"
    end

    def greet
      output.puts 'Enter configuration: '
    end

    def result
      output.puts 'Search result:'
    end

    def gets_configuration
      input.gets.send(format_method)
    end

    def gets_max_iterations
      input.gets.chomp.to_i
    end

    def create_agent
      @agent = case problem
               when SLIDING_PUZZLE then agent_class.new(new_problem)
               when EIGHT_QUEENS   then agent_class.new(4.times.map { new_random_problem }, @options)
               end
    end

    def agent_class
      "#{problem}Agent".constantize(MindBreaker)
    end

    def problem_class
      problem.constantize(MindBreaker)
    end

    def run
      start
      greet
      create_agent

      print_initial_configuration
      result
      output_search(agent.search)
    end

    def output_search(result)
      case problem
      when SLIDING_PUZZLE then output_sliding_puzzle(result)
      when EIGHT_QUEENS   then output_eight_queens(result)
      end
    end

    private

    def format_method
      "to_#{problem.scan(/[A-Z]/).join.downcase}".to_sym
    end

    def new_problem
      problem_class.new(gets_configuration)
    end

    def new_random_problem
      problem_class.new(random_eight_queens)
    end

    def random_eight_queens
      8.times.collect { (rand * 7).round }
    end

    def output_sliding_puzzle(result)
      result.chosen_path.each_with_index do |node, index|
        print_puzzle(index, node)
      end
    end

    def print_puzzle(index, node)
      output.puts "Step #{index + 1}:"
      output.puts "f(n) = #{node.function}"
      print_head(5)
      node.problem.state.each_with_index do |value, key|
        output.print '|' + value.to_s
        output.print "|\n" if key % 3 == 2
      end
      print_head(5)
      print_breakline
    end

    def output_eight_queens(result)
      print_found(result)
      print_population
    end

    def print_found(result)
      output.puts(result ? 'A result was found!' : 'No result found')
    end

    def print_population
      output.puts 'Last population:'
      agent.problem.each do |individual|
        print_goal(individual)
        output.printf("P(i) = %3.2f%\n", individual.probability * 100)
        print_chessboard(individual)
        print_goal(individual)
        print_breakline
      end
    end

    def print_chessboard(individual)
      print_head(8)
      for i in (0..7)
        output.print '|'
        for j in (0..7)
          output.print(individual.state[j] == i ? 'Q' : '.')
        end
        output.print "|\n"
      end
      print_head(8)
    end

    def print_goal(individual)
      output.puts '=====GOAL=====' if individual.goal?
    end

    def print_initial_configuration
      agent.problem.each do |individual|
        output.puts(individual.state.join('')) if @problem == EIGHT_QUEENS
      end
    end

    def print_head(number)
      output.print "*#{'-' * number}*\n"
    end

    def print_breakline
      print "\n"
    end
  end
end
