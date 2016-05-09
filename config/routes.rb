Rails.application.routes.draw do
  mount Raddocs::App => "/docs"
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :create, :destroy] do
      resources :trends
    end
    resources :predictions, only: [:show]
    resources :trends, only: [:index, :create, :destroy] do
      resources :occurrences, only: [:index, :create, :destroy]
    end
  end
end
