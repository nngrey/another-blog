Blog::Application.routes.draw do

  root :to => 'posts#index'

  devise_for :users do
      resources :comments
    end

  resources :posts do
      resources :comments
  end

  resources :comments
end
