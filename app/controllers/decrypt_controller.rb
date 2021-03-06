require 'openssl'
require 'base64'
class DecryptController < ApplicationController
  def decrypt
    id = params[:id]

    if id.to_i > Stark.last.id
      render plain: "There is no such key to decrypt with"
    end
    message = params[:message]
    key_id = id
    key = OpenSSL::PKey::RSA.new 2048
    key.n = Stark.find(key_id).n.to_i
    key.e = Stark.find(key_id).e.to_i
    key.d = Stark.find(key_id).d.to_i
    message = Base64.decode64(message)
    decrypted_message = key.private_decrypt(message)
    new_message = DecryptedMessage.create(:decrypted_message => decrypted_message)
    render plain: new_message.id
  end
end
