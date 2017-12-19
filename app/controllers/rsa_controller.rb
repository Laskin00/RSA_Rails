require 'openssl'

class RsaController < ApplicationController

  def new_key
    key = OpenSSL::PKey::RSA.new 2048
    @private = open 'private_key.pem', 'w' do |io| io.write key.to_pem end
    @public = open 'public_key.pem', 'w' do |io| io.write key.public_key.to_pem end
    @new_keys = Rsa.create(:private_key => @private, :public_key => @public)
    render plain: @new_keys.id
  end

  def show
    id = params[:id]
    n = 1123*id.to_i#$public.params['n']
    e = 34645*id.to_i#Rsa.find(id).public_key.params['e']not working
    d = 12312412*id.to_i#Rsa.find(id).public_key.params['d']
    render plain: "'"'{"' + id.to_s + '"' + ':' + 'n = ' + n.to_s + ' e = ' + e.to_s + ' d = ' + d.to_s + ' "}'"'" + "\n"
  end

end
