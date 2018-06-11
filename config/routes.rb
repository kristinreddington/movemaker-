Rails.application.routes.draw do

  root 'static_pages#home'

  resources :lessons

  resources :users do
    post '/bookings' => 'bookings#create'
    resources :bookings, only: [:destroy, :show]
  end

  get '/signin' => 'sessions#new'
  resources :sessions, only: [:create]
  post '/signout' => 'sessions#destroy'
end
