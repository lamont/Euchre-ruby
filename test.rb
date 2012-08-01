require 'Deck'

theDeck = Deck.new
p theDeck.examine
theDeck.shuffle!
p theDeck.examine

puts "one card"
puts theDeck.deal!
puts "#{theDeck.length} cards left"

puts "two cards"
puts theDeck.deal!(2)
puts "#{theDeck.length} cards left"


