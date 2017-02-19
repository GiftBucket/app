Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  get '/communities', to: 'communities#index'
  get '/communities/:id', to: 'communities#display'
  resources :memberships
  resources :communities
  resources :charities
  resources :profiles
  resources :leaderboards
end
