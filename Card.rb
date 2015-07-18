class Card
  
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
           
  def initialize(rank, suit)
    @card = rank[:face] + suit[:name][0,1].downcase
  end

  def to_s
    @card
  end

  def <=>(othercard, trumpSuit)
    # fix this, make it 
    @card
  end


end
         