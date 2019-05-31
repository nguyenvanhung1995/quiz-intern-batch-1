Rails.application.routes.draw do
  root   "static_pages#index"
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get    "/history", to: "tests#index"

  resources :users

  scope shallow_prefix: "current" do
    resources :categories, only: :index do
      resources :tests, shallow: true
    end
  end

  namespace :admin do
    root "dashboards#index"
    get    "/login",   to: "sessions#new"
    post   "/login",   to: "sessions#create"
    delete "/logout",  to: "sessions#destroy"

    resources :categories
    resources :questions
    resources :users
    resources :tests, only: [:index, :show]
    
  end
end
