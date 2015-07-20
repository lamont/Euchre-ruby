require_relative 'Card'

class Deck < Card
            
  def initialize()
    @cards = Array.new
    # hearts, diamonds, clubs, spades
    SUITS.keys.each do |suit|
      RANKS.keys.each do |rank|
        # a card is the first letter of the suit plus the rank
        @cards <<  Card.new(rank,suit)
      end        
    end
  end
  
  def shuffle!
    @cards.shuffle!
  end
  
  def examine
    @cards.map { |c| c.to_s }
  end

  def deal!(num=1)
    @cards.shift(num)
  end

  def length
    @cards.length
  end

end

