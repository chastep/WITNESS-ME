require "rails_helper"

RSpec.describe "Routing to challenges", :type => :routing do

  it "routes GET /challenges/new to challenges#new" do
    expect(:get => "/challenges/new").to route_to("challenges#new")
  end

  it "routes GET /challenges/1 to challenges#show" do
    expect(:get => "/challenges/1").to route_to("challenges#show", :id => "1")
  end

  it "routes POST /challenges to challenges#create" do
    expect(:post => "/challenges").to route_to("challenges#create")
  end

  it "routes GET /challenges to challenges#edit" do
    expect(:get => "/challenges/1/edit").to route_to("challenges#edit", :id => "1")
  end

  it "routes PUT /challenges/1 to challenges#update" do
    expect(:put => "/challenges/1").to route_to("challenges#update", :id => "1")
  end

  it "routes DELETE /challenges/1 to challenges#destroy" do
    expect(:delete => "/challenges/1").to route_to("challenges#destroy", :id => "1")
  end

end
