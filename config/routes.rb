Rails.application.routes.draw do

  # Establish the root url of the site
  root 'home#index'
  
  # Contact URLS
  get 'contact'                 => 'contact#index'
  get 'contact/finished'        => 'contact#finished'
  get 'contact/finished/:data'  => 'contact#finished'
  post 'contact'                => 'contact#create'
  
  # Responses URLS
  #get 'responses'   => 'responses#index'
  
  # Events URLS
  get 'events'      => 'event#index'
  
  # About URLS
  get 'about'       => 'about#index'

  # Admin URLS
  get "admin" => "admin/home#index"
  namespace :admin do

    get "home"    => "home#index",        :as => "root"
    get "logout"  => "sessions#destroy",  :as => "log_out"
    get "login"   => "sessions#new",      :as => "log_in"
    get "signup"  => "users#new",         :as => "sign_up"

    resources :users
    resources :sessions
    resources :messages
    resources :events
  end

end
