require 'rspec'

describe 'create a card' do

  before :each do
    @nine_of_hearts = Card.new('9', 'Hearts')
    @jack_of_spades = Card.new('J', 'Spades')
  end

  context 'with a single card' do
    it 'can create a 9 of Hearts' do
      expect(@nine_of_hearts.to_s).to eq "9h"
    end
    it 'can create a Jack of Spades' do
      expect(@jack_of_spades.to_s).to eq "Js"
    end
    it 'knows what suit a card is' do
      expect(@jack_of_spades.suit).to eq "Spades"
    end
    it 'knows what rank a card is' do
      expect(@jack_of_spades.rank).to eq "J"
    end
    it 'can identify if a card is trump' do
      expect(@nine_of_hearts.is_trump?('Hearts')).to be_truthy
      expect(@nine_of_hearts.is_trump?('Diamonds')).to be_falsey
      expect(@jack_of_spades.is_trump?('Hearts')).to be_falsey
      expect(@nine_of_hearts.is_trump?('Hearts')).to be_truthy
    end
  end

  # context 'with two cards, hearts being trump' do
  #   it 'knows 9h beats Js' do
  #     expect(@nine_of_hearts.beats?(@jack_of_spades,'Hearts')).to be_truthy
  #     expect(@jack_of_spades.beats?(@nine_of_hearts,'Hearts')).to be_falsey
  #
  #   end
  # end
end