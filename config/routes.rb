Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # constraints ->  request { request.session[:user_id].present? } do
  #   # ログインしてる時のパス
  #   root 'groups#index'
  # end
  # # ログインしてない時のパス
  # root 'tops#index'

  # if user_signed_in?
  #   root 'groups#index'
  # else
  #   root 'tops#index'
  # end

  root 'tops#index'
  # root 'groups#index'
  resources :searches, only: :index do
    collection do
      get 'search'
    end
  end

  resources :users, only: :show
  resources :groups, only: [:index, :show, :create, :destroy] do
    collection do
      get 'search'
      get 'reset_index'
    end
    resources :pages, only: [:index, :show, :create, :destroy]
    resources :users, only: [:index, :new, :create, :destroy] do
      collection do
        get 'invite'
        post 'add'
      end
    end
  end
end
