Rails.application.routes.draw do
  resources :roles
  get 'students/delete'
  get 'pages/index'
  get 'students/file'

  get 'users/index'
  post 'users/updateRoles'
  get 'users/destroy'
  resources :graduating_classes do
    collection {
      get :delete
    }
  end
  resources :students do
    collection {
      post :import
      get :file
      post :findStudent
      get :payDues
      patch :updateDues
      get :calculateDues
      get :email
    }
  end



  root 'pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
