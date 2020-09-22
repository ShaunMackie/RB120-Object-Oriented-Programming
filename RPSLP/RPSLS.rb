require 'yaml'
MESSAGES = YAML.load_file('RPSLS.yml')

module Formatable
  def prompt(message)
    puts("=> #{message}")
  end

  def messages(message)
    prompt(MESSAGES[message])
  end

  def clear
    system('clear') || system('cls')
  end

  def line_break
    puts "\n"
  end
end

class Move
  VALUES = { 'r' => 'rock',
             'p' => 'paper',
             's' => 'scissors',
             'l' => 'lizard',
             'o' => 'spock' }

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.paper? || other_move.spock?)) ||
      (spock? && (other_move.rock? || other_move.scissors?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  include Formatable

  def set_name
    n = ''
    clear
    puts messages('name')
    loop do
      n = gets.chomp
      break unless n.empty?
      clear
      puts messages('invalid_input')
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts messages('choices')
      choice = gets.chomp.downcase
      break if Move::VALUES.keys.include?(choice)

      puts messages('invalid_choice')
    end
    self.move = Move.new(Move::VALUES[choice])
  end
end

class Computer < Player
  DRACULA_VALUES = { 'r' => 'rock' }

  FRANKENSTEIN_VALUES = { 'r' => 'rock',
                          'p' => 'paper',
                          's' => 'scissors',
                          'l' => ['lizard', 'lizard', 'rock'].sample,
                          'o' => ['rock', 'rock', 'lizard', 'lizard'].sample }

  def set_name
    self.name = ['Dracula', 'Frankenstein', 'The Mummy', 'Werewolf'].sample
  end

  def choose
    self.move = case name
                when 'Dracula'
                  Move.new(Computer::DRACULA_VALUES.values.sample)
                when 'Frankenstein'
                  Move.new(Computer::FRANKENSTEIN_VALUES.values.sample)
                else
                  Move.new(Move::VALUES.values.sample)
                end
  end
end

class RPSGame
  include Formatable
  attr_reader :human, :computer, :human_history, :computer_history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_history = []
    @computer_history = []
  end

  def display_welcome_message
    clear
    puts prompt("Hello, #{human.name}!")
    puts messages('welcome')
    puts messages('rules')
  end

  def display_goodbye_message
    puts messages('exit_message')
  end

  def display_moves
    puts prompt("#{human.name} chose #{human.move}.")
    puts prompt("#{computer.name} chose #{computer.move}.")
  end

  def display_winner
    if human.move > computer.move
      puts prompt("#{human.name} won!")
    elsif computer.move > human.move
      puts prompt("#{computer.name} won!")
    else
      puts prompt("It's a tie!")
    end
  end

  def save_moves
    @human_history << human.move
    @computer_history << computer.move
  end

  def display_history(player, player_history)
    puts "#{player.name.upcase}'S MOVE HISTORY:"
    line_break

    player_history.each_with_index do |move, index|
      puts "#{index + 1}. " + move.to_s
    end
    line_break
  end

  def winner
    winner = "human" if human.move > computer.move
    winner = "computer" if computer.move > human.move
    winner
  end

  def keep_score(winner)
    if winner == "human"
      human.score += 1
    elsif winner == "computer"
      computer.score += 1
    end
  end

  def display_current_score
    puts prompt("The score is: #{human.name} - #{human.score} : " \
    "#{computer.name} - #{computer.score}")
  end

  def grand_winner?
    human.score == 2 || computer.score == 2
  end

  def declare_grand_winner
    if human.score == 2
      puts prompt("Congratulations! You are the Grand Winner!")
    elsif computer.score == 2
      puts prompt("The match is over! #{computer.name} is the Grand Winner!")
    end
  end

  def continue_playing?(message)
    answer = nil
    loop do
      puts messages(message)
      answer = gets.chomp.downcase
      break if %w(y yes q quit).include?(answer)

      puts messages('invalid_choice')
    end
    clear
    return true if answer == 'y' || answer == 'yes'

    false
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def reset_move_history
    @human_history = []
    @computer_history = []
  end

  def break_condition
    human.score < 2 && computer.score < 2
  end

  def make_choices
    human.choose
    computer.choose
    clear
  end

  def reset_game
    reset_move_history
    reset_score
  end

  def display_histories
    display_history(human, human_history)
    display_history(computer, computer_history)
  end

  def display_score
    keep_score(winner)
    display_current_score
  end

  def game_loop
    loop do
      until grand_winner?
        make_choices
        display_moves
        display_winner
        save_moves
        display_score
        if break_condition
          break unless continue_playing?('continue?')
        end
      end
      declare_grand_winner
      display_histories
      reset_game
      break unless continue_playing?('play_again?')
    end
  end

  def play
    display_welcome_message
    game_loop
    display_goodbye_message
  end
end

RPSGame.new.play
