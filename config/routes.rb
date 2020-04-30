Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :motorcycles do

    collection do
      get :my_motorcycles
    end

    resources :bookings, except: [:edit, :destroy, :update]
      collection do
        get :my_bookings
      end
  end
end







# Rails.application.routes.draw do
#   resources :restaurants do
#     collection do
#       get :top
#     end
#   end
# end
