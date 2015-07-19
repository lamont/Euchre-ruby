require 'rspec'

describe 'create a card' do

  # before :each do
  #   @aCard = Card.new
  # end

  context 'with a single card' do
    it 'can create a 9 of Hearts' do
      @aCard = Card.new(Card::Ranks.select { |r| r[:face] == '9' }.first,
                        Card::Suits.select { |c| c[:name] == 'Hearts' }.first)
      expect(@aCard.to_s).to eq "9h"
    end
    it 'can create a Jack of Spades' do
      @aCard = Card.new(Card::Ranks.select { |r| r[:face] == 'J' }.first,
                        Card::Suits.select { |c| c[:name] == 'Spades' }.first)
      expect(@aCard.to_s).to eq "Js"
    end
    it 'knows what suit a card is' do
      @aCard = Card.new(Card::Ranks.select { |r| r[:face] == 'J' }.first,
                        Card::Suits.select { |c| c[:name] == 'Spades' }.first)
      expect(@aCard.suit).to eq "Spades"
    end
    it 'knows 9h is trump when hearts is trump' do
      @aCard = Card.new(Card::Ranks.select { |r| r[:face] == '9' }.first,
                        Card::Suits.select { |c| c[:name] == 'Hearts' }.first)
      expect(@aCard.is_trump?('Hearts')).to be_truthy
      expect(@aCard.is_trump?('Diamonds')).to be_falsey
    end
  end

  # context 'with two cards, spades being trump' do
  #   card1 = Card.new(Card::Ranks.select { |r| r[:face] == '9' }.first,
  #                    Card::Suits.select { |c| c[:name] == 'Hearts' }.first)
  #   card2 = Card.new(Card::Ranks.select { |r| r[:face] == '9' }.first,
  #                    Card::Suits.select { |c| c[:name] == 'Hearts' }.first)
  #   trump = Card::Suits.select { |c| c[:name] == 'Spades' }.first
  #   expect(card1.beats?(card2,trump))
  # end
end