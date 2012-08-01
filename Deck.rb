class Deck

  # the [] with => in it is a shortcut for an array of hashes
  # you can get the string value of a symbol via the .to_s, like :red.to_s yields "red"
  Suits = [ :name => "Hearts", :color => :red] +
          [ :name => "Diamonds", :color => :red] +
          [ :name => "Clubs", :color => :black] +
          [ :name => "Spades", :color => :black]
  Ranks = [ :face => "9", :order => 9 ] +
          [ :face => "T", :order => 10 ] +
          [ :face => "J", :order => 11 ] +
          [ :face => "Q", :order => 12 ] +
          [ :face => "K", :order => 13 ] +
          [ :face => "A", :order => 14 ]
            
  def initialize()
    @cards = Array.new
    # hearts, diamonds, clubs, spades
    Suits.each do |suit|
      Ranks.each do |rank|
        # a card is the first letter of the suit plus the rank
        @cards <<  rank[:face] + suit[:name][0,1].downcase
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
    @cards
  end

  def deal!(num=1)
    @cards.shift(num)
  end

  def length
    @cards.length
  end

end

