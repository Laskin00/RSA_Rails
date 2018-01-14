require 'openssl'
require 'base64'

class RsaController < ApplicationController
  def new_key
    if params[:n] == nil || params[:e] == nil || params[:d] == nil
      key = OpenSSL::PKey::RSA.new 2048
      new_keys = Stark.create(:n => key.n, :e => key.e, :d => key.d)
      render plain: new_keys.id
    end
    if params[:n] != nil || params[:e] != nil || params[:d] != nil
      n = params[:n]
      e = params[:e]
      d = params[:d]
      new_keys = Stark.create(:n => n, :e => e, :d => d)
      render plain: new_keys.id
    end
  end

    def show
      key = Stark.find(params[:id])
      render json: {n:key.n.to_i,e:key.e.to_i,d:key.d.to_i}
    end
end
