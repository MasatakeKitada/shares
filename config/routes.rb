Rails.application.routes.draw do
  devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'groups#index'

  resources :searches, only: :index do
    collection do
      get 'search'
    end
  end

  resources :groups, only: [:index, :show, :create, :destroy] do
    resources :pages, only: [:index, :show, :create, :destroy]
    resources :users, only: [:index, :new, :show, :create, :destroy] do
      collection do
        get 'invite'
        post 'add'
      end
    end
  end
end
