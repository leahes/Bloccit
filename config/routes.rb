Rails.application.routes.draw do
  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
    resources :comments, only: [:create, :destroy]
  end

    resources :posts, only: [] do
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'faq' => 'welcome#faq'
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
