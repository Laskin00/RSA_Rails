require 'openssl'

class RsaController < ApplicationController

  def new_key
    key = OpenSSL::PKey::RSA.new 2048
    new_keys = Rsa.create(:private_key => key)
    render plain: new_keys.id
  end

end
