Rails.application.routes.draw do
  root to: "spots#index"
  devise_for :users

  resources :spots do
    resources :reviews
  end

  get '/about', to: 'pages#about'


  resources :spots, only: :destroy, as: :destroy_spot
end
