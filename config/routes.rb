Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  get 'page_search' => 'searches#index'

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
