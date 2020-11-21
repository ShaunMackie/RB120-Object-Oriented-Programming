require 'yaml'
MESSAGES = YAML.load_file('TTT.yaml')

module Formatable
  def clear_screen
    system 'clear' || 'cls'
  end

  def prompt(message)
    puts("=> #{message}")
  end

  def messages(message)
    prompt(MESSAGES[message])
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def marked_keys
    @squares.keys.select { |key| @squares[key].marked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  def []=(num, marker)
    @squares[num].marker = marker
  end  
  
  def [](num)
    @squares[num].marker
  end

  def find_at_risk_square(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares, marker)
        return line
      end
    end
    nil
  end

  private

  def two_identical_markers?(squares, marker)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 2 && !markers.uniq.empty?
    markers.all? {|m| m == marker} && !markers.empty?
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :name, :marker

  def initialize
    set_name
    set_marker
    @marker = marker
    @score = 0
  end
end

class Human < Player
  include Formatable

  def set_name
    n = ''
    clear_screen
    puts messages('name')
    loop do
      n = gets.chomp
      break unless n.empty? || (n.gsub(' ', '') != n)
      clear_screen
      puts messages('invalid_name_input')
    end
    self.name = n
  end

  def set_marker
    choice = nil
    loop do
      puts messages('choose_marker')
      choice = gets.chomp.upcase
      break if ('A'..'Z').to_a.include?(choice)
      clear_screen
      puts messages('invalid_choice')
    end
    self.marker = choice
  end
end
# rubocop: disable Layout/LineLength
class Computer < Player
  def set_name
    self.name = ['Ivan the Boneless', 'Gregor the Terrible', 'Erik the Fearless', 'Ragnar the Bloodless'].sample
  end
  # rubocop: enable Layout/LineLength

  def set_marker
    marker = ('A'..'Z').to_a.sample
    self.marker = marker
  end
end

class TTTGame
  include Formatable

  attr_reader :board, :human, :computer

  TOTAL_WINS = 2
  CENTER = 5

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_marker = nil
  end

  def play
    clear_screen
    display_welcome_message
    main_game
    clear_screen
    display_goodbye_message
  end

  private

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    validate_markers
    loop do
      inner_main_game_loop
      reset_score
      break unless play_again?('another_round?')
      reset_board
    end
  end

  def inner_main_game_loop
    loop do
      announce_and_set_who_goes_first(choose_who_goes_first)
      display_board
      player_move
      display_result
      manage_score_and_grand_winner
      break if grand_winner?
      break unless play_again?('continue?')

      reset_board_and_display_play_again_message
    end
  end

  def choose_who_goes_first
    player_choice = nil
    puts messages('choose_first_to_act')
    loop do
      puts messages('go_first')
      player_choice = gets.chomp.downcase
      clear_screen
      break if %w(a b).include?(player_choice)
      puts messages('invalid_choice')
    end
    player_choice
  end

  def announce_and_set_who_goes_first(player_choice)
    if player_choice == 'a'
      @current_marker = human.marker
      puts prompt("You're going first!")
    else
      @current_marker = computer.marker
      puts "#{computer.name} plays first!"
    end
  end

  def display_welcome_message
    puts prompt("Hello #{human.name}! Welcome to Tic Tac Toe!")
    puts messages('rules')
    puts prompt("Today you will be battling against #{computer.name}!")
  end

  def display_goodbye_message
    puts messages('exit_message')
  end

  def display_play_again_message
    puts messages('play_again')
  end

  def reset_board_and_display_play_again_message
    reset_board
    display_play_again_message
  end

  # rubocop: disable Layout/LineLength
  def display_board
    puts prompt("You're a #{human.marker}. #{computer.name.split[0]} is a #{computer.marker}.")
    line_break
    board.draw
    line_break
  end
  # rubocop: enable Layout/LineLength

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def manage_score_and_grand_winner
    keep_score
    display_current_score
    declare_grand_winner if grand_winner?
  end

  def joinor(arr, delimiter = ', ', word = 'or')
    case arr.size
    when 1 then arr.first
    when 2 then arr.join(" #{word} ")
    else
      arr[-1] = "#{word} #{arr.last}"
      arr.join(delimiter)
    end
  end

  def display_available_squares
    puts prompt("Choose a square: #{joinor(board.unmarked_keys)} ")
  end

  def human_moves
    square = nil
    loop do
      square = gets.chomp
      if board.unmarked_keys.include?(square.to_i) && square.to_s.length == 1
        break
      end
      puts messages('invalid_choice')
      display_available_squares
    end

    board[square.to_i] = human.marker
  end

  def defend_at_risk_square
    return unless board.find_at_risk_square.size == 2
    board[board.find_at_risk_square] << computer.marker
  end 
  
  def computer_moves
    square = computer_offensive_move ||
             computer_defensive_move ||
             middle_move || board.unmarked_keys.sample
    board[square] = computer.marker
  end   
  
  def computer_offensive_move
    square = board.find_at_risk_square(computer.marker)
    if square
      square = square.select {|number| board[number] == Square::INITIAL_MARKER}.first
    end
    square
  end   
  
  def computer_defensive_move
    square = board.find_at_risk_square(human.marker)
    if square
      square = square.select {|number| board[number] == Square::INITIAL_MARKER}.first
    end
    square
  end   
  
  def middle_move
    board[CENTER] == Square::INITIAL_MARKER ? 5 : nil
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts messages('victor')
    when computer.marker
      puts prompt("#{computer.name.split[0]} was the victor this round!")
    else
      puts messages('tie')
    end
  end

  def play_again?(message)
    answer = nil
    loop do
      puts messages(message)
      answer = gets.chomp.downcase
      break if %w(y n yes no).include?(answer)
      puts messages('invalid_choice')
    end

    clear_screen
    answer == 'y'
  end

  def reset_board
    board.reset
    clear_screen
  end

  def line_break
    puts "\n"
  end

  def current_player_moves
    if human_turn?
      display_available_squares
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def keep_score
    if board.winning_marker == human.marker
      human.score += 1
    elsif board.winning_marker == computer.marker
      computer.score += 1
    end
  end

  def display_current_score
    prompt("The score is: #{human.name} - #{human.score} : " \
    "#{computer.name} - #{computer.score}")
    line_break
  end

  def grand_winner?
    human.score == TOTAL_WINS || computer.score == TOTAL_WINS
  end

  def declare_grand_winner
    if human.score == TOTAL_WINS
      puts prompt("You have defeated #{computer.name}!")
    elsif computer.score == TOTAL_WINS
      puts prompt("You have been defeated by #{computer.name}!")
    else
      clear_screen
      line_break
    end
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def validate_markers
    alphabet = ('A'..'Z').to_a
    index = alphabet.index(human.marker)
    computer.marker = alphabet[index - 1] if human.marker == computer.marker
  end
end

game = TTTGame.new
game.play
