require 'minitest/autorun'
require './card'

class CardTest < MiniTest::Test

  include Comparable

  def test_a_card_has_a_face
    card = Card.new("7", "spades")
    assert_equal 7, card.face
  end

  def test_a_card_has_a_suit
    card = Card.new("ace", "diamonds")
    assert_equal "diamonds", card.suit
  end

  def test_a_card_has_a_value
    new_card = Card.new("10", "clubs")
    assert_equal 10, card.value
  end

  def test_a_card_can_be_compared
    card1 = Card.new("10", "clubs")
    card2 = Card.new("5", "hearts")
    assert card1 > card2
  end

end
