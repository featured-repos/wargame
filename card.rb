
class Card

  include Comparable

  attr_accessor :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def value
    values = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "10" => 10,
      "jack" => 11,
      "queen" => 12,
      "king" => 13,
      "ace" => 14
    }
    values[face]
  end

  def <=>(other)
    value <=> other.value
  end

end
