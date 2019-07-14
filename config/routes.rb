Rails.application.routes.draw do
  namespace :api do
    resources :restaurants, except: [:destroy, :update] do
      resources :dishes, only: [:index]
    end
  end

  namespace :api do
    resources :dishes, except: [:destroy, :update] do
      resources :restaurants, only: [:index]
    end
  end
end
