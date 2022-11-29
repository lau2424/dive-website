Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"

  resources :spots do
    resources :reviews
  end

  resources :spots, only: :destroy, as: :destroy_spot
end
