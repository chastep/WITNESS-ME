require "rails_helper"

RSpec.describe "Routing to users", :type => :routing do

  it "routes GET /users/new to users#new" do
    expect(:get => "/users/new").to route_to("users#new")
  end

  it "routes GET /users/1 to users#show" do
    expect(:get => "/users/1").to route_to("users#show", :id => "1")
  end

  it "routes POST /users to users#create" do
    expect(:post => "/users").to route_to("users#create")
  end

end
