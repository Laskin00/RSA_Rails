require 'rails_helper'

RSpec.describe RsaController do

  it "Creates an rsa key pairing and checks the Rsa model" do
    post :new_key
    expect(response.body).to eq("1")
  end

  it "Shows an rsa and checks is the rsa saved correctly" do
    post :new_key
    get :show, params: {id: 1}
    expect(JSON.parse(response.body)).to include("n", "e", "d")
  end

  it "Creates and rsa with n e and d and show it" do
    post :new_key , params: {n: 10, e: 20, d: 30}
    get :show, params: {id: 1}
    expect(JSON.parse(response.body)).to include("n" => 10, "e" => 20, "d" => 30)
  end
end
