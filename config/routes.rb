Rails.application.routes.draw do
  get '/users/remove_all', to: 'users#remove_all'
  resources :users

  get 'hi/index'

  root "welcome#index"

  get 'about', to: 'welcome#about'
end

