Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get "/users/:id", to: "users#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get "/savings/:id/index", to:"savings#index"
  resources :savings

  get '/incomes/search', to:"incomes#search"
  post '/incomes/search', to:"incomes#create"
  resources :incomes do
    collection {get "search"}
     resources :incomes, only: [ :new ]
   end

 #  get"/expends",          to:"expends#new"
 #  post "/expends",        to:"expends#create"
 #  get"/expends/new",      to:"expends#new"
 #  get "/expends/:id/edit",to:"expends#edit"
#   patch"/expends/:id",    to:"expends#update"
 #  put"/expends/:id",      to:"expends#update"
 #  delete"/expends/:id",   to:"expends#destroy"
   get '/expends/search',  to:"expends#search"
   post '/expends/search', to:"expends#create"
   resources :expends do
    collection {get "search"}
     resources :expends, only: [ :new ]
   end


 get "/analyses", to:"analyses#show"
 get '/analyses/search', to:"analyses#search"

end
