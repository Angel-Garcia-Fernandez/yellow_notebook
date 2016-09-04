Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # home page for not authenticated users:
  #root to: 'pages#about'
  root :to => 'high_voltage/pages#show', id: 'about'

  # web for authenticated users:
  devise_for :users
  resources :users

end
