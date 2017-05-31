Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :election_types
    root to: 'welcome#index'


    get '/welcome/your_candidatures'
    get '/vote/:id' => 'welcome#vote', as: 'vote'

    devise_for :users

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    resources :election_candidates
    resources :election_users

    resources :elections
  end

end
