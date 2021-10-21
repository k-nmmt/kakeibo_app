Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :incomes
  resources :expends
  resources :savings
  get "/users/:id", to: "users#show"
  get "/savings/:id/index", to:"savings#index"
  get "/analyses", to:"analyses#show"
  get '/analyses/search', to:"analyses#search"
  get '/incomes/search', to:"incomes#search"
  post '/incomes/search', to:"incomes#create"
  get '/expends/search', to:"expends#search"
  post '/expends/search',to:"expends#create"
end
