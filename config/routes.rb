Rails.application.routes.draw do
  post 'rsas' => 'rsa#new_key'
  post 'rsas' => 'rsa#new_key'
  post 'rsas/:id/encrypt_messages' => 'encrypt#encrypt'
  post 'rsas/:id/decrypt_messages' => 'decrypt#decrypt'
  get 'rsas/:id' => 'rsa#show'
  get 'rsas/:id/encrypt_messages/:id2' => 'encrypt#show'
end
