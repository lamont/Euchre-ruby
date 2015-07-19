class Card
  
  # the [] with => in it is a shortcut for an array of hashes
   # you can get the string value of a symbol via the .to_s, like :red.to_s yields "red"
   Suits = { "Hearts" => :red,
             "Diamonds" => :red,
             "Clubs" => :black,
             "Spades" => :black }
   Ranks = { "9" => 9,
             "T" => 10,
             "J" => 11,
             "Q" => 12,
             "K" => 13,
             "A" => 14 }
           
  def initialize(rank, suit)
    @card = rank.upcase + suit[0,1].downcase
  end

  def to_s
    @card
  end

  def beats?(othercard, trumpSuit)
    case
      # if self is trump and other card isn't, then self wins
      when self.is_trump?(trumpSuit) && !othercard.is_trump?(trumpSuit)
        return true
      # if self isn't trump and other card is, other wins
      when !(self.is_trump(trumpSuit)) &&  othercard.is_trump?(trumpSuit)
        return false
      # if neither are trump, order wins
      when  !(self.is_trump(trumpSuit)) && !(othercard.is_trump?(trumpSuit))
        return self.order(trumpSuit) > othercard.order(trumpSuit)
      # if both are trump, special case order
        #when
    end
      return false
    end

   def suit
     Suits.keys.select {|s| s.downcase.start_with?(@card[1]) }.first
   end

   def rank
     @card[0]
   end

   def order(trumpSuit)

   end

  def is_trump?(trumpSuit)
    # need to include jack of color
    self.suit.downcase == trumpSuit.downcase
  end


end
         