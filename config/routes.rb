Rails.application.routes.draw do
  root "pages#index"
  get "dashboard", to: 'dashboard#index'
  get "login", to: "sessions#new"

  post "sign_in", to: "sessions#create"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:show, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end
  resources :practices, only: [:show, :create, :update, :destroy] do
      get 'code/:practice_code', on: :collection, to: "practices#show_by_code", as: :code
  end
  
  resources :appointments

end
