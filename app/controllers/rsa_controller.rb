require 'openssl'

class RsaController < ApplicationController

  def new_key
    $public = OpenSSL::PKey::RSA.new File.read 'public_key.pem'
    $private = OpenSSL::PKey::RSA.new File.read 'private_key.pem'
    $new_keys = Rsa.create(:private_key => $private, :public_key => $public)
    render plain: @new_keys.id
  end

  def show
    id = params[:id]
    n = 1123#$public.params['n']
    e = 34645#Rsa.find(id).public_key.params['e']
    d = 12312412#Rsa.find(id).public_key.params['d']
    render plain: "'"'{' + id.to_s + ':' + '"' + 'n = ' + n.to_s + ' e = ' + e.to_s + ' d = ' + d.to_s + ' "}'"'" + "\n"
  end

end
