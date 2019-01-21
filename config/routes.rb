Rails.application.routes.draw do
  get 'braintree/new'
  get 'welcome/index'
  root "listings#index"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

resources :listings do
  resources :reservations
end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get "/profile" => "users#show", as: "profile"
  post 'braintree/checkout'
  get "/search_page" => "listings#search", as: "search_page"
  post "/advance_search" => "listings#advance_search", as: "advance_search"
  post "/index_search" => "listings#index_search", as: "index_search"
  get "/index_search" => "listings#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
        