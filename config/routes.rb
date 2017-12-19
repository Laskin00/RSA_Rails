Rails.application.routes.draw do
  post 'rsas' => 'rsa#new_key'
  get 'rsas/:id' => 'rsa#show'
  post 'rsas/:id/encrypt_messages' => 'encrypt#encrypt'
  get 'rsas/:id/encrypt_messages/:id' => 'encrypt#show'
  post 'rsas/:id/decrypt_messages' => 'decrypt#decrypt'
end
