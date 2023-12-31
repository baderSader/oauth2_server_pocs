Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  resources :home

  namespace :api do
    namespace :v1 do
      get "who_am_i" => "info#who_am_i"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"
end
