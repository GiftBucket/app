Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  get '/communities', to: 'communities#index'
  get '/communities/:id', to: 'communities#display'
  get '/memberships/', to: 'memberships#index'
  get '/joincommunity/:id', to: 'memberships#create'
  get '/accountdetails', to: 'banking#account'
  get '/addtobalance/:amount', to: 'banking#add_balance'
  get '/banking', to: 'banking#index'
  resources :communities
  resources :charities
  resources :profiles
  resources :leaderboards
  resources :donations
end
