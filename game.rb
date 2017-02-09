require './card'
require './deck'
require 'tty'

class WarGame

  attr_accessor :player1_deck, :player2_deck, :p1_cards_won, :p2_cards_won, :round_counter, :prompt

  def initialize
    @prompt = TTY::Prompt.new
    @player1_deck = Deck.new
    @player1_deck.cards.shuffle!
    @player2_deck = Deck.new
    @player2_deck.cards.shuffle!
    @p1_cards_won = []
    @p2_cards_won = []
    @round_counter = 0
    draw_a_card
  end

  def draw_a_card
    @player1_card = player1_deck.cards.shift
    @player2_card = player2_deck.cards.shift
    compare_cards
  end


  def compare_cards
    if @player1_card == @player2_card
      # explorer mode doesn't care what happens when there's a tie
    elsif @player1_card > @player2_card
      @p1_cards_won += [@player1_card, @player2_card]
    elsif @player2_card > @player1_card
      @p2_cards_won += [@player1_card, @player2_card]
    end
    @round_counter += 1

    if @player1_deck.cards.count == 0 && @player2_deck.cards.count == 0
      determine_winner
    end
    draw_a_card
  end


  def determine_winner
    message = ""
    if @p1_cards_won.count > @p2_cards_won.count
      message = "Player 1 won this game after #{round_counter} rounds with #{@p1_cards_won.count} cards."
    elsif @p1_cards_won.count < @p2_cards_won.count
      message = "Player 2 won this game after #{round_counter} rounds with #{@p2_cards_won.count} cards."
    else
      message = "It's a tie!"
    end

    if prompt.yes?("#{message} Would you like a rematch?")
      initialize
    else
      puts "Goodbye."
      exit
    end
  end

end

puts WarGame.new
