require 'rails_helper'

describe ChallengesController do

  let(:challenge) { Challenge.new(description: "This is a challenge", challenger_id: 1000, challenger_id: 1, acceptor_id: 2, witness_id: 1, winner_id: 1)}

  describe "GET #new" do
    it "responds with status code 200" do

    end

    it "assigns a new user to @user" do

    end

    it "renders the :new template" do

    end
  end

  describe "GET #show" do
      it "responds with status code 200" do

      end

      it "renders the :show template" do

      end
  end

end
