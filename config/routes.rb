Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }  

  resources :posts do
  	resources :comments
  	member do
  		get 'like'
  	end
  end

  get 'profiles/show'

  root 'posts#index'  


  patch ':user_name/edit', to: 'profiles#update', as: :update_profile  
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile




end
