require 'rails_helper'

describe User do

    let(:user) { User.new(first_name: "Liz", last_name: "Hart", email: "elizabethwhart@gmail.com", phone: "555-555-5555", username: "LizHart", profile_picture: "http://vignette2.wikia.nocookie.net/ghostbusters/images/1/11/Bill_Murray.jpeg/revision/latest?cb=20081013140955", password: "password", dwolla_url: "thisisaurl", dwolla_id: "6" )}

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

    describe "split_name" do
      it "grabs a first name from a full name" do
        user.split_name("Karl Thomas")
        expect(user.first_name).to eq("Karl")
      end

      it "grabs a last name from a full name" do
        user.split_name("Karl Thomas")
        expect(user.last_name).to eq("Thomas")
      end
    end

    describe "show_full_name" do
      it "displays the full name of the user" do
        expect(user.show_full_name).to eq("Liz Hart")
      end
    end

    describe "customer_request_body" do
      it "creates a dwolla customer request hash from the user's data" do
        expect(user.customer_request_body).to eq({
          :firstName => user.first_name,
          :lastName => user.last_name,
          :email => user.email
        })
      end
    end

end

