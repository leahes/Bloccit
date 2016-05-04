Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/contact'

  get 'welcome/about'

  root 'welcome#index'
end
