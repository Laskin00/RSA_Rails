require 'openssl'
require 'base64'
class DecryptController < ApplicationController
  def decrypt
    id = params[:id]

    if id.to_i > Stark.last.id
      render plain: "There is no such key to decrypt with"
    end

    message = EncryptedMessage.find(id).encrypted_message
    key_id = EncryptedMessage.find(id).key_id
    key = OpenSSL::PKey::RSA.new 2048
    key.n = Stark.find(key_id).n.to_int
    key.n = Stark.find(key_id).e.to_int
    key.n = Stark.find(key_id).d.to_int
    message = Base64.decode64(message)
    decrypted_message = key.public_decrypt(message)
    new_message = DecryptedMessage.create(:decrypted_message => decrypted_message)
  end

  def show
    id = params[:id]
    message = DecryptedMessage.find(id).decrypted_message
    render plain: message
  end
end
