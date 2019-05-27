Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :questions
    resources :users
    resources :tests, only: [:index, :show]
  end
end
