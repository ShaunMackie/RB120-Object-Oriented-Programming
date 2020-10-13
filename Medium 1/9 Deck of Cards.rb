=begin

#Problem

- use the Card class from the previous exercise, create a Deck class that contains all the standard 52 playing cards
- use the below given code to start your work:

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end

- the Deck class should provide a #draw method to deal one card
- the deck should be shuffled when it is initialized
- if the deck runs out of cards, it should reset itself by generating a new set of 52 shuffled cards

#Brainstorming
- so we want to use a constructor method
- we should initailize an empty array to store the deck
- we could use a nested each loop to create the deck?
- easy to call shuffle on the array to shuffle and pop on the deck to draw a card and when the deck is empty to just regenerate a new deck

#Algorithm 

# Implementation Notes 

=end

class Card
  include Comparable
  attr_reader :rank, :suit

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

class Deck 
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :new_deck

  def initialize
    @new_deck = []
    create_deck.shuffle!
  end

  def create_deck
    full_deck = []

    RANKS.each do |rank|
      SUITS.each do |suit|
        full_deck.push(Card.new(rank, suit))
      end
    end
    self.new_deck = full_deck
  end

  def draw
    create_deck if new_deck.empty?
    new_deck.pop
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2