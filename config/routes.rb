Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :adverts
  root 'adverts#index'
  resources :users
  resources :adverts do
    resources :comments, shallow: true
  end
end
