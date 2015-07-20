class Card

  # the [] with => in it is a shortcut for an array of hashes
  # you can get the string value of a symbol via the .to_s, like :red.to_s yields "red"
  SUITS = { :hearts => :red,
            :diamonds => :red,
            :clubs => :black,
            :spades => :black }
  RANKS = { '9' => 9,
            'T' => 10,
            'J' => 11,
            'Q' => 12,
            'K' => 13,
            'A' => 14 }

  def initialize(rank, suit)
    @card = rank.to_s.upcase + suit.to_s[0,1].downcase
  end

  def to_s
    @card
  end

  def suit
    SUITS.keys.select {|s| s.to_s.downcase.start_with?(@card[1]) }.first
  end

  def color
    SUITS.select {|s,v| s.to_s.downcase.start_with?(@card[1]) }.values.first
  end

  def rank
    @card[0]
  end

  def order(trumpSuit)
    # order + 6 if it is trump + 4 if it is a bower + 1 if it is the right bower
    RANKS[self.rank] +
        (self.is_trump?(trumpSuit) ? 6 : 0) +
        ((self.rank == 'J' and self.is_trump?(trumpSuit)) ? 4 : 0) +
        ((self.rank == 'J' and self.suit == trumpSuit and self.color == SUITS[trumpSuit]) ? 1 : 0)
  end

  def is_trump?(trumpSuit)
    (self.suit == trumpSuit) or (self.rank == 'J' and self.color == SUITS[trumpSuit])
  end

  def beats?(othercard, trumpSuit)
    self.order(trumpSuit) > othercard.order(trumpSuit)
  end

end
         