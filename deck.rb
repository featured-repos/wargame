require './card'

class Deck

  attr_accessor :cards

  def initialize
    make_a_deck_of_cards
  end

  def make_a_deck_of_cards
    suits = %w(spades hearts clubs diamonds)
    faces = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
    @cards = faces.product(suits).collect { |face, suit| Card.new(face, suit) }
    # @cards = suits.collect do |suit|
    #          faces.collect do |face|
    #            Card.new(face, suit)
    #             end
    #             end
    # @cards.flatten!
  end

end
