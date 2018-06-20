Rails.application.routes.draw do

  root 'static_pages#home'
  get '/lessons/expired' => 'lessons#expired', as: :expired_lessons
  resources :lessons


  resources :users do
    resources :bookings, only: [:new, :create, :edit, :show, :update]
  end
  get '/bookings/:id/delete' => 'bookings#destroy', as: :delete_booking

  get '/signin' => 'sessions#new'
  resources :sessions, :only => [:create]
  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'
end
