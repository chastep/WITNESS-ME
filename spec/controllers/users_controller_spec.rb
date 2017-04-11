require 'rails_helper'

describe UsersController do

  let!(:user) { User.create!(first_name: "Karl", last_name: "Thomas", email: "karl@karl.com", phone: "555-555-5555", username: "KThomas", password: "password") }

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    context "when user is logged in" do

      before(:each) do
        session[:user_id] = user.id
      end

      it "responds with status code 200" do
        get :show, { id: user.id }
        expect(response).to have_http_status 200
      end

      it "assigns the session id to the user's id" do
        get :show, { id: user.id }
        expect(session[:user_id]).to eq(user.id)
      end

      it "renders the :show template" do
        get :show, { id: user.id }
        expect(response).to render_template(:show)
      end
    end

    context "when no user is logged in" do
      it "responds with status code 302" do
        get :show, { id: user.id }
        expect(response).to have_http_status 302
      end

      it "renders the login page" do
        get :show, { id: user.id }
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST #create" do

  end

  describe "GET #edit" do

  end

  describe "PUT #update" do

  end

end
