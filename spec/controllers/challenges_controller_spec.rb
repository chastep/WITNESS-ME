require 'rails_helper'

describe ChallengesController do

  let(:challenge) { Challenge.create!(description: "This is a challenge", price: 1000, challenger_id: 1, acceptor_id: 2, witness_id: 1, winner_id: 1)}

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "assigns a new user to @user" do
      get :new
      expect(assigns(:challenge)).to be_a_new Challenge
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
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
    it "responds with status code 200" do
      get :edit, { id: challenge.id }
      expect(response).to have_http_status(200)
    end

    it "renders the :edit template" do
      get :edit, { id: challenge.id }
      expect(response).to render_template(:edit)
    end
  end

  # describe "POST #destroy" do

  #   it "responds with status code 200" do
  #     session[:user_id] = 1
  #     post :destroy, { id: challenge.id }
  #     expect(response).to have_http_status(200)
  #   end

  #   it "redirects to the user login page" do
  #     post :destroy, { id: challenge.id }
  #     expect(response).to redirects_to(root_path)
  #   end
  # end

end