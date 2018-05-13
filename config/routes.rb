# require 'sidekiq/web'

Rails.application.routes.draw do
  resources :blogs
  resources :jobs
  devise_for :users
  #root 'jobs#index'
  root 'pages#home'

  get "/pages/home" => "pages#home"
  get "/pages/quiz" => "pages#quiz" 
  get '/my_calender' => 'pages#my_calender'
  get '/test_events' => 'pages#test_events'

  post '/apply_test_events' => 'pages#apply_test_events'
  resources :events
  resources :blogs
  namespace :admin do
    resources :users, only: %I[index update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
