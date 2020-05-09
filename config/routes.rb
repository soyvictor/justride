Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :motorcycles do
    resources :bookings, only: [:create, :destroy]
    collection do
      get :my_motorcycles, :my_motorcycles_host
    end


  end

    resources :bookings, except: [:edit, :destroy, :update] do
      collection do
        get :upcoming_bookings, :past_bookings, :host_upcoming_bookings, :host_past_bookings
      end
    end


end

