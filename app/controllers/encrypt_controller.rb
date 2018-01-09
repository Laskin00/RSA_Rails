require 'openssl'
require 'base64'

class EncryptController < ApplicationController
  def encrypt

    if params[:id].to_i > Stark.last.id
      render plain: "There is no such key"
    end
    message = params[:message]
    key_to_use = Stark.find(params[:id])
    key = OpenSSL::PKey::RSA.new 2048
    key.n = key_to_use.n.to_i
    key.e = key_to_use.e.to_i
    key.d = key_to_use.d.to_i
    encrypted_message = key.public_encrypt(message)
    encrypted_message = Base64.encode64(encrypted_message)
    new_message = EncryptedMessage.create(:encrypted_message => encrypted_message, :key_id => key_to_use.id)
    render plain: new_message.id
  end

  def show
    id = params[:id]
    message = EncryptedMessage.find(id).encrypted_message
    render plain: message
  end
end
