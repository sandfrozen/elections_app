Rails.application.routes.draw do
  resources :election_candidates
  resources :election_users
  resources :elections
  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
