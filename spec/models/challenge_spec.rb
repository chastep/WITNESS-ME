require 'rails_helper'

describe Challenge do

  let(:challenge) { Challenge.new(description: "This is a challenge", price: 1000, challenger_id: 1, acceptor_id: 2, witness_id: 3, winner_id: 1)}

  describe "description" do
    it "returns the description of the challenge" do
      expect(challenge.description).to eq("This is a challenge")
    end
  end

  describe "price" do
    it "returns the price of the challenge" do
      expect(challenge.price).to eq(1000)
    end
  end

  describe "challenger_id" do
    it "returns the challenger_id of the challenge" do
      expect(challenge.challenger_id).to eq(1)
    end
  end

  describe "acceptor_id" do
    it "returns the acceptor_id of the challenge" do
      expect(challenge.acceptor_id).to eq(2)
    end
  end

  describe "witness_id" do
    it "returns the witness_id of the challenge" do
      expect(challenge.witness_id).to eq(3)
    end
  end

  describe "winner_id" do
    it "returns the winner_id of the challenge" do
      expect(challenge.winner_id).to eq(1)
    end
  end

end
