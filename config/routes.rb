Rails.application.routes.draw do
  get 'sessions/new'
  get '/', to: 'users#new'
  get '/users', to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
