Rails.application.routes.draw do
  post 'rsas' => 'rsa#key_with_parrams_given'
  post 'rsas' => 'rsa#new_key'
  post 'rsas/:id/encrypt_message' => 'encrypt#encrypt'
  post 'rsas/:id/decrypt_messages' => 'decrypt#decrypt'
  get 'rsas/:id' => 'rsa#show'
  get 'rsas/:id/encrypt_messages/:id2' => 'encrypt#show'
  get 'rsas/decrypt_messages/:id' => 'decrypt#show'
end
