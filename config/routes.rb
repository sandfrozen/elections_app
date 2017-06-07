Rails.application.routes.draw do

  #scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :election_types
    root to: 'welcome#index'


    get '/welcome/your_candidatures'
    get '/welcome/about'
    post '/welcome/save_vote'
    post 'generate' => 'welcome#generate', as: :generate
    get '/vote/:id' => 'welcome#vote', as: 'vote'

    get '/election_result/:id' => 'welcome#election_result', as: 'result'
    get '/election_info/:id' => 'welcome#election_info', as: 'information'

    devise_for :users

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    resources :election_candidates
    resources :election_users

    resources :elections
  #end

end
