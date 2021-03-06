Rails.application.routes.draw do

  resources :xls_files
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # home page for not authenticated users:
  #root to: 'pages#about'
  root :to => 'high_voltage/pages#show', id: 'about'

  # web for authenticated users:
  devise_for :users, skip: :registration
  # as :user do
  #   get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #   put 'users' => 'devise/registrations#update', :as => 'user_registration'
  # end


  resources :users do
    get :edit_password, on: :member
    get :edit_teacher_user, on: :member
  end

  #user_management
  resources :teachers do
    get :show_activities, on: :member
    get :edit_activities, on: :member
    put :update_activities, on: :member
    patch :update_activities, on: :member
    resources :activity_classes, controller: :my_activity_classes do #monitor management
      get :show_student_class_data, on: :member
      get :edit_student_class_data, on: :member
      put :add_all_student_to_class, on: :member
      patch :add_all_student_to_class, on: :member
      put :update_student_class_data, on: :member
      patch :update_student_class_data, on: :member
      resources :student_class_data, controller: :my_student_class_data,
          only: [:edit, :show, :update]
    end
    resources :activities, only: :index, controller: :my_activities do #monitor management
      get :show_activity_classes, on: :member
    end
  end

  #admin
  resources :activities do
    get :show_time_week_cycles, on: :member
    get :edit_time_week_cycles, on: :member
    patch :update_time_week_cycles, on: :member
    put :update_time_week_cycles, on: :member

    get :show_activity_classes, on: :member
    get :edit_activity_classes, on: :member
    patch :update_activity_classes, on: :member
    put :update_activity_classes, on: :member

    put :create_activity_classes, on: :member
    resources :activity_classes, controller: :activities do
      delete :destroy_activity_class, on: :member
      resources :student_class_data, controller: :student_class_data,
                only: [:index, :edit, :show, :update, :destroy]
    end

    get :show_students, on: :member
    get :edit_students, on: :member
    patch :students, action: :update_students, on: :member
    put :students, action: :update_students, on: :member
  end
  resources :schools
  resources :school_representatives

  resources :student_activity_sign_ups
  resources :students do
    get :show_activities, on: :member
    get :edit_activities, on: :member
    patch :activities, action: :update_activities, on: :member
    put :activities, action: :update_activities, on: :member
  end

  resources :guardians

  resources :teacher_activities
  resources :activity_classes
  #resources :student_class_data
  #resources :time_week_cycles

  resources :courses

  # data_exploitation
  resources :attendance_summaries, only: [ :new, :create, :show ] do
  end

  # data_feed
  resources :xls_files do
    match :download, on: :member, via: [:post, :get]
    resources :parses do
      resources :feedings, only: :create
      resources :re_feedings, only: :create
    end
  end
end
