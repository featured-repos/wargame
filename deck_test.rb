require 'minitest/autorun'
require_relative 'deck'

class DeckTest < MiniTest::Test

  attr_accessor :card

  def test_a_deck_has_52_cards
    deck = Deck.new
    assert_equal 52, deck.cards.count
  end

  def test_a_deck_contains_13_of_each_suit
    deck = Deck.new
    suits = %w(spades hearts clubs diamonds)
    suits.each do |suit|
      assert deck.cards.select { |card| card.suit == suit }.count == 13
    end
  end

  def test_a_deck_contains_four_of_each_face
    deck = Deck.new
    faces = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
    faces.each do |face|
      assert deck.cards.select { |card| card.face == face }.count == 4
    end
  end

  def test_a_deck_can_be_reshuffled
    deck = Deck.new
    deck.cards = []
    card1 = Card.new("6", "hearts")
    card2 = Card.new("3", "diamonds")
    deck.reshuffle([card1, card2])
    assert deck.cards.length == 2
    assert deck.cards.include? card1
    assert deck.cards.include? card2
  end

end
