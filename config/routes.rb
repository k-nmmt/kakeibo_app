Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get "/users/:id", to: "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"


  #get "/incomes",  to:"incomes#new"
  #post "/incomes", to:"incomes#create"
  resources :incomes

  #get"/expends", to:"expends#new"
  #get "/expends/new", to:"expends#new"
  #post "/expends", to:"expends#create"
  #get "/expends/:id/edit", to:"expends#edit"
  #patch "/expends/:id", to: "expends#update"
  #delete "/expends/:id", to:"expends#destroy"
  resources :expends


 #get "/savings", to:"savings#new"
 #post "/savings", to:"savings#create"
resources :savings

  get "/analyses", to:"analyses#show"
end
