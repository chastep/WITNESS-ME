require 'rails_helper'

describe User do

    let(:user) { User.new(first_name: "Liz", last_name: "Hart", email: "elizabethwhart@gmail.com", phone: "555-555-5555", username: "LizHart", profile_picture: "picture.com", password: "password", dwolla_url: "thisisaurl", dwolla_id: "6" )}

    describe "first_name" do
      it "returns the first name of the user" do
        expect(user.first_name).to eq("Liz")
      end
    end

    describe "last_name" do
      it "returns the last name of the user" do
        expect(user.last_name).to eq("Hart")
      end
    end

    describe "email" do
      it "returns the email of the user" do
        expect(user.email).to eq("elizabethwhart@gmail.com")
      end
    end

    describe "phone" do
      it "returns the phone number of the user" do
        expect(user.phone).to eq("555-555-5555")
      end
    end

    describe "username" do
      it "returns the username of the user" do
        expect(user.username).to eq("LizHart")
      end
    end

    describe "profile_picture" do
      it "returns the profile_picture of the user" do
        expect(user.profile_picture).to eq("picture.com")
      end
    end

    describe "dwolla_url" do
      it "returns the dwolla_url of the user" do
        expect(user.dwolla_url).to eq("thisisaurl")
      end
    end

    describe "dwolla_id" do
      it "returns the dwolla_id of the user" do
        expect(user.dwolla_id).to eq("6")
      end
    end

end

