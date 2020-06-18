Rails.application.routes.draw do
  get '/', to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
end
