Rails.application.routes.draw do
  #post 'rsas/:n/:e/:d' => 'rsa#new_key'
  #post 'rsas' => 'rsa#new_key'
  #get 'rsas/:id' => 'rsa#show'
  post 'rsas/:id/encrypt_messages/:message' => 'encrypt#encrypt'
  get 'rsas/:id/encrypt_messages/:id' => 'encrypt#show'
  post 'rsas/:id/decrypt_messages/:message' => 'decrypt#decrypt'
  get 'rsas/decrypt_messages/:id' => 'decrypt#show'
end
