Rails.application.routes.draw do
  resources :exercises
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :workouts
  post 'workouts/search', to: 'workouts#search', as: 'search'
  root 'workouts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
