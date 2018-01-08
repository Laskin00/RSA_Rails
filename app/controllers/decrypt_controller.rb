require 'openssl'
require 'base64'
class DecryptController < ApplicationController
  def decrypt
    id = params[:id]
    message = EncryptedMessage.find(id).encrypted_message
    decrypted_message = Base64.decode64(message)
    new_message = DecryptedMessage.create(:decrypted_message => decrypted_message)
  end

  def show
    id = params[:id]
    message = DecryptedMessage.find(id).decrypted_message
    render plain: message
  end
end
