Rails.application.routes.draw do
  get 'docs/index'
  devise_for :users, path: 'auth', :controllers => {:registrations => "registrations",  confirmations: 'confirmations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  
  resources :bsp_trainings
  resources :llc_services
  resources :medications
  resources :medication_counts
  resources :mars
  resources :behaviors
  resources :docs

  resources :users do
    get :reset_password, on: :member
    get 'settings', on: :collection
    get 'edit_password', on: :collection
    put 'update_password', on: :collection
  end
end
