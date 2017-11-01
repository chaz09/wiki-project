Rails.application.routes.draw do

  get 'charges/create'
  get 'charges/new'

devise_for :users
resources :users
resources :wikis


resources :collaborators, only: [:index, :new, :destroy, :update]
resources :charges, only: [:new, :create]
resources :collaborators

get '/users/sign_out' => 'devise/sessions#destroy'
get "login", :to => "devise/sessions#new"
 get "register", :to => "devise/registrations#new"
 get "settings", :to => "devise/registrations#edit"
 get "logout",   :to => "devise/sessions#destroy"

get 'wikis/show'

get 'about' => 'welcome#about'
root "welcome#index"
 get 'users/downgrade/:customer' => 'charges#downgrade_account', as: :downgrade_account
get 'collaborators/:id' => 'collaborators#new', as: "new_collaborators_for_wiki"
end
