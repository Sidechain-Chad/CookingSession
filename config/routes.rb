Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

<<<<<<< HEAD
=======
  # CookingTutorial routes with nested Bookings
  resources :cooking_tutorials do
    resources :bookings, only: [:new, :create]
  end

  # Standalone routes for viewing and managing bookings
  resources :bookings, only: [:index, :show, :edit, :update]

>>>>>>> origin/foundation-code
  # Defines the root path route ("/")
  # root "posts#index"
end
