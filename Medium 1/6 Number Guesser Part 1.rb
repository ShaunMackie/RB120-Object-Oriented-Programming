=begin

#Problem

- create an OO number guessing class for numbers in the range of 1 to 100
- a game has a limit of 7 guesses per game

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 
- create a game that prompts a user to guess a number between 1 and 100.
  - if the user's guess is lower than the number 
    - tell them it is too low
  - if the user's guess is higher than the number
    - tell them it's too high

if they guess the correct number in 7 guesses or less, tell them they won
  - else tell them they lost

# Implementation Notes 

- create a GuessingGame class
  - the main game loop is called 'play'
  - it needs a constructor with an instance variable with the starting numbef of guesses, which is 7

output the string, "You have 7 guesses remaining"
prompt the user to enter a number between 1 and 100
  - validate there input
let the user know if their guess is too high or too low or correct
  - if it is correct, let them know they've won - this needs it's own method
  - else prompt them for a new guess

if they guess 7 times and all are incorrect, let them know they've lost - this needs it's own method?

=end

class GuessingGame
  attr_accessor :guesses, :number, :current_guess

def initialize
  @guesses = 7
  @number = rand(1..100)
  @current_guess = current_guess
end

def line_break
  puts "\n"
end

def display_remaining_guesses
  puts "You have #{guesses} guesses remaining."
  line_break
end

def prompt_user_for_guess
  answer = nil

  loop do
    puts "Enter a number between 1 and 100: "
    answer = gets.chomp.to_i
    break if answer.between?(1, 100)
    puts "Invalid guess."
  end
  self.current_guess = answer
end

def subtract_guess
  self.guesses -= 1
end

def display_hint_to_user(user_guess)
  puts "Your guess is too low." if user_guess < number
  puts "Your guess is too high" if number < user_guess
  line_break
end

def user_won?(guess)
  guess == number
end

def user_lost?
  guesses == 0
end

def display_winning_message
  puts "That's the number!"
  puts ""
  puts "You won!"
end

  def play
    loop do
      #until user_lost?
      display_remaining_guesses
      prompt_user_for_guess
      display_winning_message if user_won?(current_guess)
      break if user_won?(current_guess)
      subtract_guess
      break if user_lost?
      display_hint_to_user(current_guess)
    end
    puts "You have no more guesses. You lost!" if user_lost?
  end
end

game = GuessingGame.new
#p game.number
game.play
