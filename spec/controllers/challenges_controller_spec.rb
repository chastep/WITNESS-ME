require 'rails_helper'

ActiveSupport::Deprecation.silenced = true

describe ChallengesController do

  let(:user) { User.create!(first_name: "Karl", last_name: "Thomas", email: "karl@karl.com", phone: "555-555-5555", username: "KThomas", password: "password") }

  let(:user1) { User.create!(first_name: "Liz", last_name: "Hart", email: "liz@hart.com", phone: "555-555-5555", username: "LHart", password: "password") }

  let(:user2) { User.create!(first_name: "Chase", last_name: "Stephens", email: "chase@stephens.com", phone: "555-555-5555", username: "CStephens", password: "password") }

  let(:challenge) { Challenge.create!(description: "This is a challenge", price: 10, challenger_id: user.id, acceptor_id: user1.id, witness_id: user2.id, winner_id: user1.id, loser_id: user2.id)}

  describe "GET #new" do

    before(:each) do
      session[:user_id] = user.id
    end

    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "assigns a new challenge to :challenge" do
      get :new
      expect(assigns(:challenge)).to be_a_new Challenge
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do

    before(:each) do
      session[:user_id] = user.id
    end

    it "responds with status code 200" do
      get :show, { id: challenge.id }
      expect(response).to have_http_status(200)
    end

    it "renders the :show template" do
      get :show, { id: challenge.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do

  end

  describe "POST #create" do

    context "when valid params are passed" do

    end

    context "when invalid params are passed" do

    end

  end

  describe "PUT #update" do

  end

  describe "DELETE #destroy" do
  #   it "responds with status code 302" do
  #     delete :destroy, { id: challenge.id }
  #     expect(response).to have_http_status 302
  #   end

  #   it "destroys the requested challenge" do
  #     expect { delete(:destroy, { id: challenge.id }) }.to change(Challenge, :count).by(-1)
  #   end

  #   it "redirects to the games list" do
  #     delete :destroy, { id: challenge.id }
  #     expect(response).to redirect_to rooth_path
  #   end
  end

end
