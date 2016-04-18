Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :trends do
      end
    end
    resources :trends, only: [:index]
  end
end
