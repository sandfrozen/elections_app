Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :election_candidates
  resources :election_users
  resources :elections
  root 'welcome#index'

  get '/vote/:id' => 'welcome#vote', as: 'vote'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
