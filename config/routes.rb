Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  root "posts#index", as: "home"
  get "/notifications", to: "notifications#check"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end

  resources :users, path: 'profile', except: [:create, :destroy, :edit, :new, :update] do
    member do
      post 'follow', to: 'follows#create'  # Create a follow relationship
      delete 'unfollow', to: 'follows#destroy'  # Remove a follow relationship
    end

    resources :posts, only: [:create, :new, :edit, :update, :destroy]

    get 'following/index'
    get 'followers/index'
  end

  resources :follows, only: [:update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
