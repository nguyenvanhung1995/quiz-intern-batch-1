Rails.application.routes.draw do

  root   "static_pages#index"
  get    "/signup", to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  resources :users
  resources :categories, only: :index do
    resources :tests
  end
  
  namespace :admin do
    root "dashboards#index"
    resources :categories
    resources :questions
    resources :users
    resources :tests, only: [:index, :show]
  end
end
