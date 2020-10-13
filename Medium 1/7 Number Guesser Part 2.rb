=begin

#Problem

- update our guessing game to include a low and a high value when we instansiate an object from the GuessinGame class
- use the given values to compute the secret number for the game
- change the number of guesses allowed so that the user can always win when playing GTO
- use this formula to calculate how many guesses we should allow: Math.log2(size_of_range).to_i + 1

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 
- update the game to accept a range of numbers
- create the secret number for that range
- allow the user x guesses, where x is a number that allows the user to always win when they take a GTO approach

# Implementation Notes 

- update the game to accept a range
  - the constructor must take two arguments - the low and high ends of the range
  - the secret number must be created from this range
    - update the @number IVAR to pull the range from the two given arguments
  - create a method to calculate the GTO number of guesses
    - this method will take two arguments - the high and low numbers
  - update the @guesses IVAR to the proper number of guesses
  - update prompt_user_for_guess method to include the new range of numbers

=end

class GuessingGame
  attr_accessor :guesses, :current_guess
  attr_reader :number, :low_num, :high_num

def initialize(low_num, high_num)
  @low_num = low_num
  @high_num = high_num
  @guesses = calculate_guesses
  @number = rand(low_num..high_num)
  @current_guess = current_guess
end

def calculate_guesses
  Math.log2(high_num - low_num).to_i + 1
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
    puts "Enter a number between #{low_num} and #{high_num}: "
    answer = gets.chomp.to_i
    break if answer.between?(low_num, high_num)
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
    calculate_guesses
    loop do
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

game = GuessingGame.new(1, 10000)
game.play
