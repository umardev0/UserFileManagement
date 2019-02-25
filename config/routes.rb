Rails.application.routes.draw do

  root 'documents#index'

  resources :documents do
    member do
      get :delete
    end
    collection do
      get :share
      post :save_share
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'home#index'
end
