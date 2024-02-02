Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'comments/index'
  get 'comments/new'
  get 'comments/edit'
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/edit'

  
  get 'home/index'
  get 'home/pricing'
  # config/routes.rb
  resources :trees do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories
  resources :comments, only: [:index, :new, :create, :edit, :update]
  resources :users, only: [:show, :edit, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  
  # Defines the root path route ("/")
  root "home#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end 
end
