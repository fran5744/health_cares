Rails.application.routes.draw do
  resources :foods
  resources :posts
  root 'logins#login'
  get 'home/top'
  get 'home/calendar_index'
  get 'logins/login'
  post 'logins/login_check'
  post 'logins/logout'
  get 'entries/serect_date_entry'

  

  post  'home/update', to: 'home#update', as: 'home_update'

  resources :entries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
