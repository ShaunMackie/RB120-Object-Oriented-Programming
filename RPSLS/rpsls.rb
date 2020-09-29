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
end

class Move
  VALUES = { 'r' => 'rock',
             'p' => 'paper',
             's' => 'scissors',
             'l' => 'lizard',
             'o' => 'spock' }

  VALUE_INTERACTIONS = { 'rock' => ['scissors', 'lizard'],
                         'paper' => ['spock', 'rock'],
                         'scissors' => ['paper', 'lizard'],
                         'lizard' => ['spock', 'paper'],
                         'spock' => ['rock', 'scissors'] }

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
    VALUE_INTERACTIONS[@value].include?(other_move.to_s)
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

private

def set_name
  n = ''
  clear
  puts messages('name')
  loop do
    n = gets.chomp
    break unless n.empty? || (n.gsub(' ', '') != n)
    clear
    puts messages('invalid_input')
  end
  self.name = n
end

class Computer < Player
  DRACULA_VALUES = { 'r' => 'rock' }

  FRANKENSTEIN_VALUES = { 'r' => 'rock',
                          'p' => 'paper',
                          's' => 'scissors',
                          'l' => ['lizard', 'lizard', 'rock', 'rock'].sample,
                          'o' => ['rock', 'rock', 'paper', 'paper'].sample }

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

  private

  def set_name
    self.name = ['Dracula', 'Frankenstein', 'The Mummy', 'Werewolf'].sample
  end
end

class RPSLSGame
  include Formatable

  def play
    display_welcome_message
    loop do
      play_full_round
      declare_grand_winner
      display_histories
      reset_game
      break unless continue_playing?('play_again?')
    end
    display_goodbye_message
  end

  private

  TOTAL_WINS = 3

  attr_reader :human, :computer, :human_history, :computer_history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_history = []
    @computer_history = []
  end

  def line_break
    puts "\n"
  end

  def display_welcome_message
    clear
    puts prompt("Hello, #{human.name}!")
    puts messages('welcome')
    puts prompt("The first player to score #{TOTAL_WINS} points wins the game!")
  end

  def display_goodbye_message
    puts messages('exit_message')
  end

  def display_moves
    puts prompt("#{human.name} chose #{human.move}.")
    puts prompt("#{computer.name} chose #{computer.move}.")
  end

  def determine_winner
    return 'human' if human.move > computer.move
    return 'computer' if computer.move > human.move
    'tie'
  end

  def display_winner(winner)
    puts prompt("#{human.name} won!") if winner == 'human'
    puts prompt("#{computer.name} won!") if winner == 'computer'
    puts prompt("It's a tie!") if winner == 'tie'
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
    human.score == TOTAL_WINS || computer.score == TOTAL_WINS
  end

  def declare_grand_winner
    if human.score == TOTAL_WINS
      puts prompt("Congratulations! You are the Grand Winner!")
    elsif computer.score == TOTAL_WINS
      puts prompt("The match is over! #{computer.name} is the Grand Winner!")
    end
  end

  def continue_playing?(message)
    answer = nil
    loop do
      return false if grand_winner?
      puts messages(message)
      answer = gets.chomp.downcase
      break if %w(y yes q quit).include?(answer)

      puts messages('invalid_choice')
    end
    clear
    %w(y yes).include?(answer)
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def reset_move_history
    @human_history = []
    @computer_history = []
  end

  def reset_game
    reset_move_history
    reset_score
  end

  def make_choices
    human.choose
    computer.choose
    clear
  end

  def display_histories
    display_history(human, human_history)
    display_history(computer, computer_history)
  end

  def display_results
    display_moves
    display_winner(determine_winner)
    display_current_score
  end

  def play_full_round
    loop do
      make_choices
      keep_score(determine_winner)
      display_results
      save_moves
      break unless continue_playing?('continue?')
    end
  end
end

RPSLSGame.new.play
