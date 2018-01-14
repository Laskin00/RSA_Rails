require 'rails_helper'

RSpec.describe EncryptController do
  it "Encrypts a message and checks if the encrypt model works correctly"do
    key = OpenSSL::PKey::RSA.new 2048
    Stark.create(:n => key.n, :e => key.e, :d => key.d)
    post :encrypt, params: {message: "Wo Lo Lo", id: 1}
    expect(response.body).to eq("1")
  end

  it "Shows an encrypted message from the encrypt model" do
    key = OpenSSL::PKey::RSA.new 2048
    Stark.create(:n => key.n, :e => key.e, :d => key.d)
    post :encrypt, params: {message: "Wo Lo Lo", id: 1}
    get :show, params: {id2: 1, id: 1}
    expect(response.body).to_not include("Wo Lo Lo")
    expect(response.body).to include("message")
  end
end
