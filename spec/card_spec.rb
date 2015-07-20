require 'rspec'

describe 'create a card' do

  before :each do
    @nine_of_hearts = Card.new('9', 'Hearts')
    @jack_of_spades = Card.new('J', 'Spades')
    @jack_of_clubs = Card.new('J', 'Clubs')
    @ten_of_hearts = Card.new('T', 'Hearts')
  end

  context 'with a single card' do
    it 'can create a 9 of Hearts' do
      expect(@nine_of_hearts.to_s).to eq "9h"
    end
    it 'can create a Jack of Spades' do
      expect(@jack_of_spades.to_s).to eq "Js"
    end
    it 'knows what suit a card is' do
      expect(@jack_of_spades.suit).to eq :spades
    end
    it 'knows what rank a card is' do
      expect(@jack_of_spades.rank).to eq "J"
    end
    it 'knows what color a card is' do
      expect(@jack_of_spades.color).to eq :black
    end
    it 'can identify if a card is trump' do
      expect(@nine_of_hearts.is_trump?(:hearts)).to be_truthy
      expect(@nine_of_hearts.is_trump?(:diamonds)).to be_falsey
      expect(@ten_of_hearts.is_trump?(:hearts)).to be_truthy
      expect(@jack_of_spades.is_trump?(:hearts)).to be_falsey
      # and the jack-of-same-color rule
      expect(@jack_of_spades.is_trump?(:clubs)).to be_truthy
    end
    it 'knows the order of cards given trump' do
      expect(@nine_of_hearts.order(:hearts)).to eq 15
      expect(@nine_of_hearts.order(:diamonds)).to eq 9
      expect(@ten_of_hearts.order(:hearts)).to eq 16
      expect(@jack_of_spades.order(:hearts)).to eq 11
      expect(@jack_of_spades.order(:spades)).to eq 22
      expect(@jack_of_clubs.order(:spades)).to eq 21
    end
  end

  context 'with two cards' do
    it 'knows 9h beats Js with hearts being trump' do
      expect(@nine_of_hearts.beats?(@jack_of_spades, :hearts)).to be_truthy
      expect(@jack_of_spades.beats?(@nine_of_hearts,:hearts)).to be_falsey
      expect(@ten_of_hearts.beats?(@nine_of_hearts, :hearts)).to be_truthy
    end
    it 'knows Js beats Jc with spades being trump' do
      expect(@jack_of_spades.beats?(@jack_of_clubs,:spades)).to be_truthy
    end
  end
end