require 'rails_helper'

RSpec.describe DecryptController do
  it "Checks for message decrypting and decrypt model work" do
    key = OpenSSL::PKey::RSA.new 2048
    Stark.create(:n => key.n, :e => key.e, :d => key.d)
    message = key.public_encrypt("WoLoLo")
    message = Base64.encode64(message)
    post :decrypt, params: {message: message, id: 1}
    expect(response.body).to eq("1")
  end

end
