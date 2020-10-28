Rails.application.routes.draw do
  get 'home/top'
  get 'home/calendar_index'
  get 'logins/login'
  post 'logins/login_check'
  post 'logins/logout'

  resources :entries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
