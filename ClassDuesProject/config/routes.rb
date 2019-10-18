Rails.application.routes.draw do

  get 'grades/delete'
  get 'students/delete'
  resources :grades
  resources :students
  get 'pages/index'


  root 'pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
