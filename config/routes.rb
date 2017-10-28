Rails.application.routes.draw do

  get 'charges/create'
  get 'charges/new'

devise_for :users
resources :users
resources :wikis

resources :wikis do
resources :collaborators, only: [:index, :new, :destroy, :update]
end
resources :charges, only: [:new, :create]


get '/users/sign_out' => 'devise/sessions#destroy'
get "login", :to => "devise/sessions#new"
 get "register", :to => "devise/registrations#new"
 get "settings", :to => "devise/registrations#edit"
 get "logout",   :to => "devise/sessions#destroy"


get 'about' => 'welcome#about'
root "welcome#index"
 get 'users/downgrade/:customer' => 'charges#downgrade_account', as: :downgrade_account
get 'collaborators/:id' => 'collaborators#new', as: "new_collaborators_for_wiki"
end
