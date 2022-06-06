Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'users#dashboard'
  resources :goals, only: %I[new create edit update]
  resources :resources, only: %I[new create index show] do
    collection do
      get :my_resources
    end
    member do
      patch :upvote
      post :toggle_favorite
    end
  end
  resources :jobs, only: %I[new create show index edit update] do
    member do
      patch :set_status
    end
  end
end
