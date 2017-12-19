require 'openssl'

class EncryptController < ApplicationController
  def encrypt
    message = params[:message]
    key = Rsa.find(params[:id]).public_key
    encrypted_message = key.public_encrypt(message);
    new_message = Encrypted_message.create(:encrypted_message => encrypted_message)
    render plain: new_message.id
  end

  def show
  end
end
