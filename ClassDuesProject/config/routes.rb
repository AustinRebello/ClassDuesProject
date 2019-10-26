Rails.application.routes.draw do

  get 'grades/delete'
  get 'students/delete'
  get 'pages/index'
  get 'students/file'
  resources :grades
  resources :students do
    collection {
      post :import
      get :file
      post :findStudent
      get :payDues

    }
  end



  root 'pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
