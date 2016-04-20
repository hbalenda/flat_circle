Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :create] do
      resources :trends
    end
    resources :trends, only: [:index, :create] do
      resources :occurrences, only: [:index, :create]
    end
  end
end
