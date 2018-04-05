Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'
  namespace :backoffice do
    resources :category, except: [:show, :destroy]
    get 'dashboard', to: 'dashboard#index'
    get 'categories', to: 'categories#index'
  end
  namespace :site do
    get 'home', to: 'home#index'
  end



  namespace :backoffice do

  end
  devise_for :admins
  devise_for :users
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
