Rails.application.routes.draw do

  resources :time_week_cycles
  resources :teacher_activities
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # home page for not authenticated users:
  #root to: 'pages#about'
  root :to => 'high_voltage/pages#show', id: 'about'

  # web for authenticated users:
  devise_for :users#, skip: :registration
  # as :user do
  #   get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #   put 'users' => 'devise/registrations#update', :as => 'user_registration'
  # end


  resources :users
  resources :teachers
  resources :student_activity_sign_ups
  resources :student_class_data
  resources :activity_classes
  resources :school_representatives
  resources :schools
  resources :account_details
  resources :guardians
  resources :students
  resources :students
  resources :activities
end
