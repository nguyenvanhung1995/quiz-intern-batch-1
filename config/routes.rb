Rails.application.routes.draw do
  
  get 'users/new'

  namespace :admin do
    resources :categories
    resources :questions
  end
end
