Rails.application.routes.draw do
  namespace :api, format: true, constraints: {format: :json} do
    namespace :v1 do
      resources :videos, only: [:index, :show]
      resources :tasks, only: [:index, :create, :destroy]
    end
  end
end
