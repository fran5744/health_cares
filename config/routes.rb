Rails.application.routes.draw do
  resources :posts
  get 'home/top'
  get 'home/calendar_index'
  get 'logins/login'
  post 'logins/login_check'
  post 'logins/logout'

  root  to: 'ajax_test#top'
  post  'ajax_test/update', to: 'ajax_test#update', as: 'ajax_test_update'

  resources :entries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
