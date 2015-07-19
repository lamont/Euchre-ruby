require 'spec_helper'

describe Deck do

  before :each do
    @aDeck = Deck.new
  end

  describe "#initalize" do
    context "creating a new deck" do
      it "has 24 cards" do
        expect(@aDeck.length).to eq 24
      end
      it "contains no duplicates" do
        expect(@aDeck.examine.uniq.length).to eq 24
      end
    end
  end


end