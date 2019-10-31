Rails.application.routes.draw do
  get 'students/delete'
  get 'pages/index'
  get 'students/file'
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
      post :updateDues
      get :calculateDues
    }
  end



  root 'pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
