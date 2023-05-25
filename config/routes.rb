Rails.application.routes.draw do
  root "posts#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end

  resources :users, except: [:create, :destroy, :edit, :new, :update] do
    member do
      post 'follow', to: 'follows#create'  # Create a follow relationship
      delete 'unfollow', to: 'follows#destroy'  # Remove a follow relationship
    end

    resources :posts, only: [:create, :new, :edit, :update, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
