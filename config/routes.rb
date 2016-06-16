Rails.application.routes.draw do
  resources :labels, only: [:show]

  resources :topics do
  resources :posts, except: [:index]
end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
<<<<<<< HEAD
  resources :posts, only: [] do
  resources :comments, only: [:create, :destroy]

=======
>>>>>>> checkpoint-38-work
  get 'about' => 'welcome#about'

  root 'welcome#index'
  end
end
