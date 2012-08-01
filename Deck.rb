require 'Card'

class Deck < Card
            
  def initialize()
    @cards = Array.new
    # hearts, diamonds, clubs, spades
    Suits.each do |suit|
      Ranks.each do |rank|
        # a card is the first letter of the suit plus the rank
        @cards <<  Card.new(rank,suit)
      end        
    end
  end
  
  def shuffle!
    # attach a random number to each card
    shuffleDeck = Hash.new
    @cards.each do |card|
      shuffleDeck[card] = rand
    end    
    # sort by that random number and replace @cards with the sorted array, stripping out the random number
    @cards = shuffleDeck.sort { |a,b| a[1] <=> b[1] }.collect {|e| e[0]}
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

