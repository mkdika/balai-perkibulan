Rails.application.routes.draw do
  resources :chats
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'chats#index'
end
