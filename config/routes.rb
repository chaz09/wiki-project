Rails.application.routes.draw do

  get 'charges/create'
  get 'charges/new'


resources :wikis
resources :users
resources :charges, only: [:new, :create]

devise_for :users
devise_scope :user do

get '/users/sign_out' => 'devise/sessions#destroy'
get "login", :to => "devise/sessions#new"
 get "register", :to => "devise/registrations#new"
 get "settings", :to => "devise/registrations#edit"
 get "logout",   :to => "devise/sessions#destroy"


get 'about' => 'welcome#about'
root "welcome#index"
end
end
