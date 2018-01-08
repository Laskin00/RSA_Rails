require 'openssl'
require 'base64'

class EncryptController < ApplicationController
  def encrypt
    message = params[:message]
    encrypted_message = Base64.encode64(message)
    new_message = EncryptedMessage.create(:encrypted_message => encrypted_message)
    render plain: new_message.id
  end

  def show
    id = params[:id]
    message = EncryptedMessage.find(id).encrypted_message
    render plain: message
  end
end
