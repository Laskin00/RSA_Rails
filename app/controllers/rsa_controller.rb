require 'openssl'
require 'base64'

class RsaController < ApplicationController
  def new_key
    if params[:n] == nil
      key = OpenSSL::PKey::RSA.new 2048
      new_keys = Stark.create(:n => key.n, :e => key.e, :d => key.d)
      render plain: new_keys.id
    end
    if params[:n] != nil
      n = params[:n]
      e = params[:e]
      d = params[:d]
      key = OpenSSL::PKey::RSA.new 2048
      key.n = n.to_i
      key.e = e.to_i
      key.d = d.to_i
      new_keys = Stark.create(:n => key.n, :e => key.e, :d => key.d)
      render plain: new_keys.id
    end
  end

    def show
      key = Stark.find(params[:id])
      render plain: "'"'{"n":' + '"' + key.n.to_s + '", ' + '"e":' + '"' + key.e.to_s + '", ' + '"d":' + '"' + key.d.to_s + '"}'"'"
    end
end
